package com.example.edu.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "users")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;

    @Column (name = "username", nullable = false, unique = true)
    private String username;

    @Column (name = "password", nullable = false)
    private String password;

    @Column(name = "role", nullable = false)
    private String role;
}
