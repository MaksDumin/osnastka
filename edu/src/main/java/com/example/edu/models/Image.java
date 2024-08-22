package com.example.edu.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Entity
@Table (name = "images")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Image {
    @Id
    @GeneratedValue (strategy = GenerationType.UUID)
    @Column (name = "id", nullable = false)
    private String id;
    @Column (name = "name")
    private String name;
    @Column (name = "originalFileName")
    private String originalFileName;
    @Column (name = "size")
    private Long size;
    @Column (name = "contentType")
    private String contentType;
    @Column (name = "isPreviewImage")
    private boolean isPreviewImage;
    @Lob
    @Column (columnDefinition = "LONGBLOB")
    private byte[] bytes;

    @ManyToOne (cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private Work work;

    @PrePersist
    private void ensureId() {
        if (this.id == null) {
            this.id = UUID.randomUUID().toString();
        }
    }
}
