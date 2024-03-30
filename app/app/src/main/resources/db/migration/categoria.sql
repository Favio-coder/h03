CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    imagen VARCHAR(255) NOT NULL,
    created_by VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    modify_by VARCHAR(255) NOT NULL,
    modify_at TIMESTAMP NOT NULL,
    status SMALLINT NOT NULL
);
