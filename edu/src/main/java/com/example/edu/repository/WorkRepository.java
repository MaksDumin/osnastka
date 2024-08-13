package com.example.edu.repository;

import com.example.edu.models.Work;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface WorkRepository extends JpaRepository <Work, Long> {
    List<Work> findByDesignationStartingWith (String designation);
}
