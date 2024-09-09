package com.example.edu.repository;

import com.example.edu.models.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<Users, String> {
    Optional<Users> findByUsername(String username);
}
