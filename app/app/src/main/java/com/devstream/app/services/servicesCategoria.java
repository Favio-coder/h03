package com.devstream.app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devstream.app.repository.categoriaRepository;

@Service
public class servicesCategoria {
     @SuppressWarnings("unused")
    @Autowired
    private categoriaRepository categoriaRepository;

    public void crearTabla() {
        // No es necesario implementar un método específico para crear la tabla,
        // Spring Data JPA creará automáticamente la tabla cuando la aplicación se inicie.
    }
}
