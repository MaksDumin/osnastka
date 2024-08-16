package com.example.edu.controller;
import com.example.edu.models.Work;
import com.example.edu.repository.WorkRepository;
import com.example.edu.services.EditWorkServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ProjectController {
    @Autowired
    private WorkRepository workRepository;
    private final EditWorkServices editWorkServices;

    public ProjectController (EditWorkServices editWorkServices) {
        this.editWorkServices = editWorkServices;
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
        model.addAttribute("works", editWorkServices.getWorkById(id));
        return "infowork";
    }
    @PostMapping("/work/create")
    public String createWork (Work work) {
        editWorkServices.saveWork(work);
        return "redirect:/";
    }

    @PostMapping ("/work/delete/{id}")
    public String deleteWork(@PathVariable Long id) {
        editWorkServices.deleteWork(id);
        return "redirect:/";
    }
    @PostMapping("/work/update/{id}")
        public String updateStorage (@PathVariable Long id, @RequestParam String storage){
        Work work = editWorkServices.getWorkById(id);
        if (work != null){
            work.setStorage(storage);
            editWorkServices.saveWork(work);
        }
        return "redirect:/work/" + id;
    }
}
