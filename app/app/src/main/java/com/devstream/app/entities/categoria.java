package com.devstream.app.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

import io.micrometer.common.lang.NonNull;

@Getter
@Setter
@Entity
@NoArgsConstructor // Agregar constructor vacío
@Data
@Table(name = "categoria")
public class categoria {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)   
    private Integer id;

    @NonNull
    private String nombre;
    @NonNull
    private String descripcion;
    @NonNull
    private String imagen;
    @NonNull
    private String created_by;
    @NonNull
    private Timestamp created_at;
    @NonNull
    private String modify_by;
    @NonNull
    private Timestamp modify_at;
    @NonNull
    private Short status;

    // Constructor que acepta los argumentos necesarios
    public categoria(String nombre, String descripcion, String imagen, String created_by, Timestamp created_at, String modify_by, Timestamp modify_at, Short status) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.created_by = created_by;
        this.created_at = created_at;
        this.modify_by = modify_by;
        this.modify_at = modify_at;
        this.status = status;
    }
}
