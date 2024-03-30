package com.devstream.app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.devstream.app.entities.categoria;
import com.devstream.app.repository.categoriaRepository;

import lombok.AllArgsConstructor;


@CrossOrigin
@AllArgsConstructor
@RequestMapping("/api/categorias")
@RestController
public class categoriaController {
    
    @Autowired
    private categoriaRepository categoriaRepository;

    //Visualizar toda las categorias
    @GetMapping
    Iterable<categoria> List(){
        return categoriaRepository.findAll();
    }

    //Visualizar categorias inactivas
    @GetMapping("/status/inactivos")
    Iterable<categoria> getCategoriasConStatus0(){
        return categoriaRepository.findByStatus((short) 0);
    }

    //Visualizar categorias activas
    @GetMapping("/status/activos")
    Iterable<categoria> getCategoriasConStatus1(){
        return categoriaRepository.findByStatus((short) 1);
    }
     
}
