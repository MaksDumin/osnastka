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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProjectController {
    @Autowired
    private WorkRepository workRepository;
    private final EditWorkServices editWorkServices;
    private final ImageRepository imageRepository;

    public ProjectController(EditWorkServices editWorkServices, ImageRepository imageRepository) {
        this.editWorkServices = editWorkServices;
        this.imageRepository = imageRepository;
    }

    @GetMapping("/")
    public String works(@RequestParam(name = "storage", required = false) String storage,
                        @RequestParam(name = "designation", required = false) String designation, Model model) {
        List<Work> works;
        if (designation != null && !designation.isEmpty() && storage != null && !storage.isEmpty()) {
            works = workRepository.findByDesignationAndStorageIgnoreCase(designation, storage);
        } else if (designation != null && !designation.isEmpty()) {
            works = workRepository.findByDesignationIgnoreCase(designation);
        } else if (storage != null && !storage.isEmpty()) {
            works = workRepository.findByStorageIgnoreCase(storage);
        } else {
            works = workRepository.findAll();
        }
        model.addAttribute("works", works);
        return "works";
    }

    @GetMapping("/work/{id}")
    public String infoWork(@PathVariable String id, Model model) {
        Work work = editWorkServices.getWorkById(id);
        if (work == null) {
            model.addAttribute("errorMessage", "Запись не найдена");
            return "redirect:/";
        }
        model.addAttribute("works", work);
        model.addAttribute("images", work.getImages());
        return "infowork";
    }

    @PostMapping("/work/create")
    public String createWork(@RequestParam("file1") MultipartFile file1, Work work) throws IOException {
        editWorkServices.saveWork(work, file1);
        return "redirect:/";
    }

    @PostMapping("/work/delete/{id}")
    public String deleteWork(@PathVariable String id, @RequestParam int quantityToDelete, Model model) throws IOException {
        Work work = editWorkServices.getWorkById(id);
        if (work != null) {
            int currentQty = work.getQty();
            if (quantityToDelete > currentQty) {
                model.addAttribute("errorMessage", "Нет достаточного запаса под списание");
                return "redirect:/work/" + id;
            } else if (quantityToDelete == currentQty) {
                editWorkServices.deleteWork(id);
            } else {
                work.setQty(currentQty - quantityToDelete);
                editWorkServices.updateWork(work);
            }
        }
        return "redirect:/";
    }

    @PostMapping("/work/update/{id}")
    public String updateStorage(@PathVariable String id, @RequestParam String storage,
                                @RequestParam String address, @RequestParam("file1") MultipartFile file1,
                                @RequestParam int quantityToMove,  Model model) throws IOException {
        Work work = editWorkServices.getWorkById(id);
        if (work != null) {
            if (quantityToMove > work.getQty()){
                model.addAttribute("errorMessage", "Нет достаточного запаса для перемещения");
                return "redirect:/work/" + id;
            } else {
             editWorkServices.handleStorageUpdate(work, storage, address ,quantityToMove, file1);
            }
        }
        return "redirect:/";
    }
    @PostMapping("/work/update-qty/{id}")
    public String updateQty(@PathVariable String id, @RequestParam int qty, RedirectAttributes redirectAttributes) {
        Work work = editWorkServices.getWorkById(id);
        if (work != null) {
            work.setQty(qty);
            editWorkServices.updateWork(work);
            redirectAttributes.addFlashAttribute("successMessage", "Количество успешно обновлено");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage","Запись не найдена");
        }
        return "redirect:/work/" + id;
    }
}