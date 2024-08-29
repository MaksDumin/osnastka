package com.example.edu.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table (name = "pasports")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pasport {
    @Id
    @GeneratedValue (strategy = GenerationType.UUID)
    @Column (name = "id", nullable = false)
    private String id;

    @Column (name = "file_name")
    private String fileName;

    @Column (name = "file_type")
    private String fileType;
    @Lob
    @Column (name = "data", columnDefinition = "LONGBLOB")
    private byte[] data;

    @OneToOne (mappedBy = "pasport", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Work work;
}
