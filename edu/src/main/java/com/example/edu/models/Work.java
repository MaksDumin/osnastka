package com.example.edu.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
    @Table (name = "works")
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public class Work {
        @Id
        @GeneratedValue (strategy = GenerationType.UUID)

        @Column (name = "id", nullable = false)
        private String id;

        @Column (name = "designation", columnDefinition = "text")
        private String designation;

        @Column (name = "notes")
        private String notes;

        @Column (name = "address")
        private String address;

        @Column (name = "qty")
        private int qty;

        @Column (name = "storage")
        private String storage;

        @Column (name = "parentStorage")
        private String parentStorage;

        @OneToMany (cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY, mappedBy = "work")
        private List<Image> images = new ArrayList<>();
        private String previewImageId;
        private LocalDateTime dateOfCreated;

        @OneToOne (cascade = CascadeType.ALL, fetch = FetchType.LAZY)
        @JoinColumn(name = "pasport_id", referencedColumnName = "id")
        private Pasport pasport;
        @PrePersist
        private void init(){
            dateOfCreated = LocalDateTime.now();
            if (this.id == null) {
                this.id = UUID.randomUUID().toString();
            }
        }

        public void addImageToWork (Image image) {
            image.setWork(this);
            images.add(image);
        }
    }
