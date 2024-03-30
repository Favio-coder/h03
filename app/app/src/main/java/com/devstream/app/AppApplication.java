package com.devstream.app;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.Arrays;
import java.util.List;
import java.sql.Timestamp; // Importar la clase Timestamp

import com.devstream.app.entities.categoria;
import com.devstream.app.repository.categoriaRepository;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.devstream.app") 
public class AppApplication {

    public static void main(String[] args) {
        SpringApplication.run(AppApplication.class, args);
    }

    @SuppressWarnings("null")
	@Bean
    CommandLineRunner runner(categoriaRepository categoriaRepository) {
        return args -> {
            List<categoria> categorias = Arrays.asList(
                new categoria("Nombre1", "Descripción1", "Imagen1", "CreadoPor1", new Timestamp(System.currentTimeMillis()), "ModificadoPor1", new Timestamp(System.currentTimeMillis()), (short) 1),
				new categoria("Nombre2", "Descripción2", "Imagen2", "CreadoPor2", new Timestamp(System.currentTimeMillis()), "ModificadoPor2", new Timestamp(System.currentTimeMillis()), (short) 0),
                new categoria("Nombre3", "Descripción3", "Imagen3", "CreadoPor3", new Timestamp(System.currentTimeMillis()), "ModificadoPor3", new Timestamp(System.currentTimeMillis()), (short) 1),
                new categoria("Nombre4", "Descripción4", "Imagen4", "CreadoPor4", new Timestamp(System.currentTimeMillis()), "ModificadoPor4", new Timestamp(System.currentTimeMillis()), (short) 0),
                new categoria("Nombre5", "Descripción5", "Imagen5", "CreadoPor5", new Timestamp(System.currentTimeMillis()), "ModificadoPor5", new Timestamp(System.currentTimeMillis()), (short) 1)
            );
			categoriaRepository.saveAll(categorias);
        };
    }
}
