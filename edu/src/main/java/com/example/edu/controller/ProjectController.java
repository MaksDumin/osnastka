package com.example.edu.controller;
import com.example.edu.models.Image;
import com.example.edu.models.Work;
import com.example.edu.repository.ImageRepository;
import com.example.edu.repository.WorkRepository;
import com.example.edu.services.EditWorkServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
public class ProjectController {
    @Autowired
    private WorkRepository workRepository;
    private final EditWorkServices editWorkServices;
    private final ImageRepository imageRepository;

    public ProjectController (EditWorkServices editWorkServices, ImageRepository imageRepository) {
        this.editWorkServices = editWorkServices;
        this.imageRepository = imageRepository;
    }

    @GetMapping ("/")
    public String works (@RequestParam (name = "storage", required = false) String storage, @RequestParam (name = "designation", required = false) String designation, Model model) {
        List<Work> works;
        if (designation !=null && !designation.isEmpty() && storage != null && storage.isEmpty()){
            works = workRepository.findByDesignationAndStorageIgnoreCase(designation, storage);
        } else if (designation != null && !designation.isEmpty()) {
            works = workRepository.findByDesignationIgnoreCase(designation);
        } else if (storage != null && !storage.isEmpty()) {
            works = workRepository.findByStorageIgnoreCase(storage);
        } else {
            works =workRepository.findAll();
        }
        model.addAttribute("works", works);
        return "works";
    }

    @GetMapping("/work/{id}")
    public String infoWork (@PathVariable Long id, Model model) {
        List<Image> images = imageRepository.findByWorkId(id);
        model.addAttribute("works", editWorkServices.getWorkById(id));
        model.addAttribute("images", images);
        return "infowork";
    }
    @PostMapping("/work/create")
    public String createWork (@RequestParam ("file1") MultipartFile file1, @RequestParam ("file2") MultipartFile file2,
                              @RequestParam ("file3") MultipartFile file3, Work work) throws IOException {
        editWorkServices.saveWork(work, file1, file2, file3);
        return "redirect:/";
    }

    @PostMapping ("/work/delete/{id}")
    public String deleteWork(@PathVariable Long id) {
        editWorkServices.deleteWork(id);
        return "redirect:/";
    }
    @PostMapping("/work/update/{id}")
        public String updateStorageAndAddress (@PathVariable Long id, @RequestParam String storage, @RequestParam String address, @RequestParam MultipartFile file1, @RequestParam MultipartFile file2, @RequestParam MultipartFile file3) throws IOException {
        Work work = editWorkServices.getWorkById(id);
        if (work != null){
            work.setStorage(storage);
            work.setAddress(address);
            editWorkServices.saveWork(work, file1, file2,file3);
        }
        return "redirect:/work/" + id;
    }
}
