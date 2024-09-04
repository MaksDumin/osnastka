package com.example.edu.services;
import com.example.edu.models.Image;
import com.example.edu.models.Pasport;
import com.example.edu.models.Work;
import com.example.edu.repository.ImageRepository;
import com.example.edu.repository.PasportRepository;
import com.example.edu.repository.WorkRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class EditWorkServices {
    private final WorkRepository workRepository;
    private final ImageRepository imageRepository;
    private final PasportRepository pasportRepository;


    public Specification<Work> getDesignation (String designation) {
        return null;
    }
    public Specification<Work> getStorage (String storage) {
            return null;
    }
@Transactional
    public void saveWork(Work work, MultipartFile file1, MultipartFile pdfFile) throws IOException{
        log.info("Новая запись в таблице сохранена. Designation {}", work.getDesignation());
        log.info("Hibernate: select w1_0.id,w1_0.address,w1_0.date_of_created,w1_0.designation,w1_0.notes,w1_0.preview_image_id,w1_0.qty,w1_0.storage from works w1_0 where lower(w1_0.designation) = lower(?)");

        if (pdfFile != null && !pdfFile.isEmpty()) {
//            boolean fileExists = pasportRepository.existsByFileName(pdfFile.getOriginalFilename());
//            if (fileExists) {
//                log.info("файл с именем {} уже существует, не добавляем", pdfFile.getOriginalFilename());
//            } else {
                Pasport pasport = new Pasport();
                pasport.setFileName(pdfFile.getOriginalFilename());
                pasport.setFileType(pdfFile.getContentType());
                pasport.setData(pdfFile.getBytes());
                pasportRepository.save(pasport);
                work.setPasport(pasport);
        }
        Work existingWork = workRepository.findByDesignationAndStorageIgnoreCase(work.getDesignation(), work.getStorage())
                .stream()
                .findFirst()
                .orElse(null);

        if (existingWork != null) {
            existingWork.setQty(existingWork.getQty() + work.getQty());

            if (existingWork.getQty() == 0) {
                workRepository.delete(existingWork);
                log.info("Запись таблицы c qty = 0 удалена у строки. Designation{}", existingWork.getDesignation());
                return;
            }
            if (file1 != null && file1.getSize() != 0) {
                Image image1 = toImageEntity(file1);
                image1.setPreviewImage(true);
                imageRepository.save(image1);
                existingWork.addImageToWork(image1);
            }
            workRepository.save(existingWork);

            } else {
            if (work.getQty() == 0) {
                workRepository.delete(work);
                log.info("Cоздание записи таблицы c qty = 0 проигнорировано у строки. Designation {}", work.getDesignation());
                return;
            }
                if (file1 != null && file1.getSize() != 0) {
                    Image image1 = toImageEntity(file1);
                    image1.setPreviewImage(true);
                    work.addImageToWork(image1);
                }

                Work workFromDb = workRepository.save(work);

                if (!workFromDb.getImages().isEmpty()) {
                    workFromDb.setPreviewImageId(workFromDb.getImages().get(0).getId());
                }
                if (workFromDb.getQty() == 0) {
                    workRepository.delete(workFromDb);
                    log.info("Запись таблицы c qty = 0 удалена у строки. Designation{}", workFromDb.getDesignation());
                }
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
@Transactional
    public void updateWork(Work work) {
        if (work.getQty() == 0) {
            workRepository.delete(work);
            return;
        }
        workRepository.save(work);
    }
@Transactional
    public void handleStorageUpdate(Work exisitngWork, String newStorage, String newAddress, int quantityToMove, MultipartFile file1) throws IOException {
        int updateQty = exisitngWork.getQty() - quantityToMove;
        exisitngWork.setQty(updateQty);
        //exisitngWork.getImages().clear();
        List<Image> copiedImages = new ArrayList<>();

        for (Image image : exisitngWork.getImages()) {
            Image copiedImage = new Image();
            copiedImage.setName(image.getName());
            copiedImage.setOriginalFileName(image.getOriginalFileName());
            copiedImage.setSize(image.getSize());
            copiedImage.setContentType(image.getContentType());
            copiedImage.setBytes(image.getBytes());
            copiedImage.setPreviewImage(image.isPreviewImage());
            copiedImages.add(copiedImage);
        }
        Pasport existingPasport = exisitngWork.getPasport();
        Pasport copiedPasport = null;
        if (exisitngWork != null) {
            copiedPasport = new Pasport();
            copiedPasport.setFileName(existingPasport.getFileName());
            copiedPasport.setFileType(existingPasport.getFileType());
            copiedPasport.setData(existingPasport.getData());
        }
        Work existingNewWork = workRepository.findByDesignationAndStorageIgnoreCase(exisitngWork.getDesignation(), newStorage)
                .stream()
                .findFirst()
                .orElse(null);
        if (existingNewWork != null) {
            existingNewWork.setQty(existingNewWork.getQty());
            if (copiedPasport != null) {
                existingNewWork.setPasport(copiedPasport);
            }
        }
        if (existingNewWork != null) {
            existingNewWork.setQty(existingNewWork.getQty() + quantityToMove);
          for (Image copiedImage :copiedImages) {
              boolean exists = existingNewWork.getImages().stream()
                              .anyMatch(image -> image.getOriginalFileName().equals(copiedImage.getOriginalFileName()));
              if (!exists) {
                  copiedImage.setWork(existingNewWork);
                  imageRepository.save(copiedImage);
                  existingNewWork.addImageToWork(copiedImage);
              }
          }
        } else {
            Work newWork = new Work();
            newWork.setDesignation(exisitngWork.getDesignation());
            newWork.setNames(exisitngWork.getNames());
            newWork.setParentStorage(exisitngWork.getParentStorage());
            newWork.setStorage(newStorage);
            newWork.setAddress(newAddress);
            newWork.setQty(quantityToMove);
            newWork.setNotes(exisitngWork.getNotes());
            if (copiedPasport != null) {
                newWork.setPasport(copiedPasport);
            }
            if (file1 != null && file1.getSize() != 0) {
                Image image1 = toImageEntity(file1);
                image1.setPreviewImage(true);
                boolean exists = newWork.getImages().stream()
                                .anyMatch(image -> image.getOriginalFileName().equals(image1.getOriginalFileName()));
                if (!exists) {
                    newWork.addImageToWork(image1);
                }
            }
            for (Image copiedImage : copiedImages) {
                boolean exists = newWork.getImages().stream()
                                .anyMatch(image -> image.getOriginalFileName().equals(copiedImage.getOriginalFileName()));
                if (!exists) {
                    copiedImage.setWork(newWork);
                    imageRepository.save(copiedImage);
                    newWork.addImageToWork(copiedImage);
                }
            }
            existingNewWork = workRepository.save(newWork);
        }
        if (existingNewWork.getImages() != null && !existingNewWork.getImages().isEmpty()) {
            existingNewWork.setPreviewImageId(existingNewWork.getImages().get(0).getId());
        }
        if (exisitngWork.getQty() == 0) {
            exisitngWork.getImages().clear();
            workRepository.delete(exisitngWork);
            return;
        }
        workRepository.save(exisitngWork);
        if (existingNewWork.getQty() == 0) {
            exisitngWork.getImages().clear();
            workRepository.delete(existingNewWork);
            return;
        }
        workRepository.save(existingNewWork);
    }

    public void replaceImages(Work work, MultipartFile newImageFile) throws IOException {
        Image currentImage = work.getImages().stream()
                .filter(Image :: isPreviewImage)
                .findFirst()
                .orElse(null);
        if (currentImage != null) {
            imageRepository.delete(currentImage);
            work.getImages().remove(currentImage);
        }
        Image newImage = toImageEntity(newImageFile);
        newImage.setPreviewImage(true);
        newImage.setWork(work);
        work.addImageToWork(newImage);
        imageRepository.save(newImage);

        work.setPreviewImageId(newImage.getId());
        workRepository.save(work);
    }
}
