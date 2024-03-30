package com.devstream.app.repository;

import org.springframework.data.repository.CrudRepository;

import com.devstream.app.entities.categoria;

public interface categoriaRepository extends CrudRepository<categoria, Integer> {
    Iterable<categoria> findByStatus(short status);
} 
