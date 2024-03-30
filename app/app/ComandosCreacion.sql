-- Creación de la tabla Perfil
CREATE TABLE Perfil (
    codigoPerfil SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    estado CHAR(1),
    usuarioCreacion VARCHAR(100),
    usuarioActualizacion VARCHAR(100),
    fechaCreacion DATE,
    fechaActualizacion DATE
);

-- Creación de la tabla Rol
CREATE TABLE Rol (
    codigoRol SERIAL PRIMARY KEY,
    codPerfil INT  NOT NULL,
    nombre VARCHAR(50)  NOT NULL,
    descripcion TEXT,
    estado CHAR(1),
    usuarioCreacion VARCHAR(100),
    usuarioActualizacion VARCHAR(100),
    fechaCreacion DATE,
    fechaActualizacion DATE,
    FOREIGN KEY (codPerfil) REFERENCES Perfil(codigoPerfil)
);

-- Creación de la tabla Usuario
CREATE TABLE Usuario (
    codigoUsuario SERIAL PRIMARY KEY,
    codPerfil INT  NOT NULL,
    codigoDocumento CHAR(1) CHECK (codigoDocumento IN ('1', '2', '3', '4'))  NOT NULL,
    numeroDocumento VARCHAR(20) UNIQUE  NOT NULL,
    nombres VARCHAR(50)  NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fechaNacimiento DATE,
    username VARCHAR(15) UNIQUE NOT NULL,
    correo VARCHAR(50) UNIQUE NOT NULL,
    prefijoNumCelular VARCHAR(5) NOT NULL,
    numCelular VARCHAR(15) UNIQUE NOT NULL,
    contrasenia VARCHAR(100) NOT NULL,
    isPrimerIngreso CHAR(1) NOT NULL,
    direccion TEXT,
    departamento VARCHAR(50),
    provincia VARCHAR(50),
    distrito VARCHAR(50),
    estado CHAR(1),
    usuarioCreacion VARCHAR(100),
    usuarioActualizacion VARCHAR(100),
    fechaCreacion DATE,
    fechaActualizacion DATE,
    FOREIGN KEY (codPerfil) REFERENCES Perfil(codigoPerfil)
);

-- Creación de la tabla UsuarioPerfilRol
CREATE TABLE UsuarioRol (
    codigoUsuarioRol SERIAL PRIMARY KEY,
    codRol INT NOT NULL,
    codUsuario INT NOT NULL,
    estado CHAR(1),
    usuarioCreacion VARCHAR(100),
    usuarioActualizacion VARCHAR(100),
    fechaCreacion DATE,
    fechaActualizacion DATE,
    FOREIGN KEY (codRol) REFERENCES Rol (codigoRol),
    FOREIGN KEY (codUsuario) REFERENCES Usuario (codigoUsuario)
);

-- Creación de la tabla Modulo
CREATE TABLE Modulo (
    codigoModulo SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    ruta VARCHAR(255),
    isServidor CHAR(1),
    icono VARCHAR(255),
    activo CHAR(1),
    estado CHAR(1),
    usuarioCreacion VARCHAR(100),
    usuarioActualizacion VARCHAR(100),
    fechaCreacion DATE,
    fechaActualizacion DATE
);

-- Creación de la tabla Acciones
CREATE TABLE Acciones (
    codigoAcciones SERIAL PRIMARY KEY,
    codRol INT,
    codModulo INT,
    listar CHAR(1),
    guardar CHAR(1),
    editar CHAR(1),
    detalle CHAR(1),
    eliminar CHAR(1),
    activar CHAR(1),
    desactivar CHAR(1),
    importar CHAR(1),
    exportar CHAR(1),
    estado CHAR(1),
    usuarioCreacion VARCHAR(100),
    usuarioActualizacion VARCHAR(100),
    fechaCreacion DATE,
    fechaActualizacion DATE,
    FOREIGN KEY (codRol) REFERENCES Rol (codigoRol),
    FOREIGN KEY (codModulo) REFERENCES Modulo (codigoModulo)
);

INSERT INTO public.perfil (codigoperfil, nombre, estado, usuarioCreacion, fechaCreacion) VALUES (DEFAULT, 'Externo', '1', 'ADMIN', '2023-05-09');
INSERT INTO public.rol (codigorol, codperfil, nombre, estado, usuarioCreacion, fechaCreacion) VALUES (DEFAULT, 1, 'Estudiante', '1', 'ADMIN', '2023-05-09');
INSERT INTO public.usuario (codigousuario, codperfil, codigodocumento, numerodocumento, nombres, apellidos, fechanacimiento, username, correo, prefijonumcelular, numcelular, contrasenia, isPrimerIngreso, direccion, departamento, provincia, distrito, estado, usuarioCreacion, fechaCreacion)
VALUES (DEFAULT, 1, '1', '72314854', 'Cesar Daniel', 'Villegas', '1999-11-13', 'daniel', 'dgutierrezvillegas@gmail.com', '+51', '917845429', '$2a$10$DbHE3lWl8sxCmO.LS/uq7uG9Y7VBm1KSRxd0wHfPhBLdW31jiaUpG', '1', 'AAHH Manuel Seoane Mz H Lote 5', 'Piura', 'Piura', 'Piura', '1', 'ADMIN', '2023-05-09');
INSERT INTO public.usuariorol (codigousuariorol, codrol, codusuario, estado, usuarioCreacion, fechaCreacion)
VALUES (DEFAULT, '1', '1', '1', 'ADMIN', '2023-05-09');

SELECT p.codigoPerfil AS codigoPerfil,
p.nombre AS nombrePerfil,
CONCAT(u.nombres, ' ', u.apellidos) AS nombreUsuario,
u.username AS username,
u.correo AS correo,
u.numeroDocumento AS numeroDocumento,
u.numCelular AS numCelular,
u.contrasenia AS contrasenia,
u.isprimeringreso AS isPrimerIngreso
FROM public.Usuario u
INNER JOIN public.Perfil p ON p.codigoPerfil = u.codPerfil
WHERE UPPER(u.username) = UPPER('daniel') OR UPPER(u.correo) = UPPER('daniel')OR UPPER(u.numeroDocumento) = UPPER('daniel') OR UPPER(u.numCelular) = UPPER('daniel');
