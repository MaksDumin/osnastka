package com.example.edu.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
    @Table (name = "osnastka")
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

    }
