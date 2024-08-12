package com.example.edu.controller;

import com.example.edu.models.Work;
import com.example.edu.services.EditWorkServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProjectController {
    private final EditWorkServices editWorkServices;

    public ProjectController (EditWorkServices editWorkServices) {
        this.editWorkServices = editWorkServices;
    }

    @GetMapping ("/")
    public String works (@RequestParam (name = "designation", required = false) String designation,  Model model) {
        model.addAttribute("works", editWorkServices.listWork(designation));
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
}
