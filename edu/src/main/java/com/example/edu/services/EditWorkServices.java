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
        log.info("Hibernate: select w1_0.id,w1_0.address,w1_0.date_of_created,w1_0.designation,w1_0.notes,w1_0.preview_image_id,w1_0.qty,w1_0.storage from works w1_0 where lower(w1_0.designation) = lower(?)");

        Work existingWork = workRepository.findByDesignationAndStorageIgnoreCase(work.getDesignation(), work.getStorage())
                .stream()
                .findFirst()
                .orElse(null);

        if (existingWork != null) {
            existingWork.setQty(existingWork.getQty() + work.getQty());

            if (file1 != null && file1.getSize() != 0) {
                Image image1 = toImageEntity(file1);
                image1.setPreviewImage(true);
                existingWork.addImageToWork(image1);
            }
            workRepository.save(existingWork);
            } else {
                if (file1 != null && file1.getSize() != 0) {
                    Image image1 = toImageEntity(file1);
                    image1.setPreviewImage(true);
                    work.addImageToWork(image1);
                }
                Work workFromDb = workRepository.save(work);
                if (!workFromDb.getImages().isEmpty()) {
                    workFromDb.setPreviewImageId(workFromDb.getImages().get(0).getId());
                }
                workRepository.save(workFromDb);
            }
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

    public void deleteWork (String id) {
        workRepository.deleteById(id);
    }

    public Work getWorkById (String id) {
        return workRepository.findById(id).orElse(null);
    }
}
