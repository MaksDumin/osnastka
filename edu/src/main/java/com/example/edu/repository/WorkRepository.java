package com.example.edu.repository;
import com.example.edu.models.Work;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface WorkRepository extends JpaRepository <Work, Long> {
    @Query ("SELECT w FROM Work w WHERE LOWER(w.designation) LIKE LOWER(CONCAT('%', :designation, '%')) AND LOWER(w.storage) LIKE LOWER(CONCAT('%', :storage, '%'))")
    List<Work> findByDesignationAndStorageIgnoreCase(@Param("designation") String designation, @Param("storage") String storage);
    @Query ("SELECT w FROM Work w WHERE LOWER(w.storage) LIKE LOWER(CONCAT('%', :storage, '%'))")
    List<Work> findByStorageIgnoreCase(@Param("storage") String storage);
    @Query ("SELECT w FROM Work w WHERE LOWER(w.designation) LIKE LOWER(CONCAT('%', :designation, '%'))")
    List<Work> findByDesignationIgnoreCase (@Param("designation") String designation);
    List<Work> findAll();

    @Modifying
    @Transactional
    @Query("UPDATE Work w SET w.storage = :storage WHERE w.id = :id")
    void updateStorageById (@Param("id") Long id, @Param("storage") String storage);
}
