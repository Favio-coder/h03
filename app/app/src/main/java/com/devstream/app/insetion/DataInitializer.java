package com.devstream.app.insetion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.devstream.app.entities.categoria;
import com.devstream.app.repository.categoriaRepository;


import java.sql.Timestamp;

@Component
public class DataInitializer {

    @Autowired
    private categoriaRepository categoriaRepository; 

    @jakarta.annotation.PostConstruct
    public void init() {
        
        // Puedes guardar más categorias si lo deseas
    }
}

