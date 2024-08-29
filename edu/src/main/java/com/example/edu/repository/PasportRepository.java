package com.example.edu.repository;

import com.example.edu.models.Pasport;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PasportRepository extends JpaRepository<Pasport, String> {
    boolean existsByFileName (String fileName);
}
