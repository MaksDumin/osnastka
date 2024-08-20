package com.example.edu.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table (name = "testimages")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Image {
    @Id
    @GeneratedValue (strategy = GenerationType.SEQUENCE, generator = "image_id_seq")
    @SequenceGenerator(name = "image_id_seq", sequenceName = "image_id_seq", allocationSize = 1)
    @Column (name = "id")
    private Long id;
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
}
