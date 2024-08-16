package com.example.edu.services;
import com.example.edu.models.Work;
import com.example.edu.repository.WorkRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class EditWorkServices {
    private final WorkRepository workRepository;

    public Specification<Work> getDesignation (String designation) {
        return null;
    }
    public Specification<Work> getStorage (String storage) {
            return null;
    }

    public void saveWork(Work work) {
        log.info("Saving new {}", work);
        workRepository.save(work);
    }

    public void deleteWork (Long id) {
        workRepository.deleteById(id);
    }

    public Work getWorkById (Long id) {
        return workRepository.findById(id).orElse(null);
    }
}
