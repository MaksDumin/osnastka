package com.example.edu.services;
import com.example.edu.models.Image;
import com.example.edu.models.Work;
import com.example.edu.repository.WorkRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

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

    public void saveWork(Work work, MultipartFile file1) throws IOException{
        log.info("Saving new Work. Designation {}", work.getDesignation());
        Image image1;
        if (file1 != null && file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            work.addImageToWork(image1);
        }
        Work workFromDb = workRepository.save(work);
        if (!workFromDb.getImages().isEmpty()) {
            workFromDb.setPreviewImageId(workFromDb.getImages().get(0).getId());
        }
        workRepository.save(workFromDb);
    }
    public Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteWork (Long id) {
        workRepository.deleteById(id);
    }

    public Work getWorkById (Long id) {
        return workRepository.findById(id).orElse(null);
    }
}
