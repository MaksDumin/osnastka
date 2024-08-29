package com.example.edu.controller;

import com.example.edu.models.Pasport;
import com.example.edu.repository.PasportRepository;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@AllArgsConstructor
public class PasportController {
    private final PasportRepository pasportRepository;
    @GetMapping("/pasport/{id}")
    @ResponseBody
    public ResponseEntity<byte[]> getPasportPdf(@PathVariable String id) {
        Pasport pasport = pasportRepository.findById(id).orElse(null);
        if (pasport != null && pasport.getData() != null) {
            HttpHeaders headers = new HttpHeaders();
            headers.set(HttpHeaders.CONTENT_DISPOSITION, "inline; filename =" + pasport.getFileName());
            headers.setContentType(MediaType.APPLICATION_PDF);
            return new ResponseEntity<>(pasport.getData(), headers, HttpStatus.OK);
        }
        return ResponseEntity.notFound().build();
    }
}
