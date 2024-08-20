package com.example.edu.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
    @Table (name = "teststring")
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public class Work {
        @Id
        @GeneratedValue (strategy = GenerationType.AUTO)

        @Column (name = "id")
        private long id;

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

        @OneToMany (cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "work")
        private List<Image> images = new ArrayList<>();
        private Long previewImageId;
        private LocalDateTime dateOfCreated;
        @PrePersist
        private void init(){
            dateOfCreated = LocalDateTime.now();
        }

        public void addImageToWork (Image image) {
            image.setWork(this);
            images.add(image);
        }
    }
