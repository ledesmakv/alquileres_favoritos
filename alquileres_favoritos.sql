/* Creamos la base de datos: alquileres_favoritos */
CREATE DATABASE alquileres_favoritos;

/* Utilizamos la base de datos alquileres_favoritos */
USE alquileres_favoritos;

/* Creamos tabla de usuarios */
CREATE TABLE IF NOT EXISTS usuarios (
	id_usuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_usuario VARCHAR(20) NOT NULL UNIQUE,
    correo VARCHAR(50) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL
);

/* Creamos tabla de tipo de contratacion */
CREATE TABLE IF NOT EXISTS tipo_contratacion (
	id_tipo_contratacion INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    /* Tipo de contratación: inmobiliaria o dueño directo */
    tipo_contratacion VARCHAR(20) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

/* Creamos tabla de departamentos */
CREATE TABLE IF NOT EXISTS departamentos (
	id_departamento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fk_id_tipo_contratacion INT NOT NULL,
    moneda VARCHAR(10) NOT NULL,
    precio INT NOT NULL,
    expensas INT NOT NULL,
    cantidad_ambientes INT NOT NULL,
    tiene_balcon BOOLEAN NOT NULL,
    permite_mascotas BOOLEAN NOT NULL,
    tiene_sum BOOLEAN NOT NULL,
    tiene_ascensor BOOLEAN NOT NULL,
    placard_empotrado BOOLEAN NOT NULL,
    superficie_total DECIMAL(3,2) NOT NULL,
    FOREIGN KEY (fk_id_tipo_contratacion) REFERENCES tipo_contratacion(id_tipo_contratacion)
);

/* Creamos tabla de favoritos como TABLA INTERMEDIA */
CREATE TABLE IF NOT EXISTS favoritos (
    fk_id_usuario INT NOT NULL,
    fk_id_departamento INT NOT NULL,
    PRIMARY KEY (fk_id_usuario, fk_id_departamento),
    FOREIGN KEY (fk_id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (fk_id_departamento) REFERENCES departamentos(id_departamento)
);