-- Active: 1704902067882@@127.0.0.1@3306@horarios

CREATE DATABASE horarios;

use horarios;

CREATE TABLE login(  
    id int AUTO_INCREMENT,
    usuario VARCHAR(50) NOT NULL,
    contraseña VARCHAR(250) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE subprograma(
    id_subprograma int AUTO_INCREMENT,
    nombre_subprograma VARCHAR(50) NOT NULL,
    n_semestre int NOT NULL,
    n_subproyectos int,
    login_id int NOT NULL,
    PRIMARY KEY(id_subprograma),
    FOREIGN KEY(login_id) REFERENCES login(id)
);

CREATE TABLE semestre(
    id_semestre int AUTO_INCREMENT,
    n_subproyectos int NOT NULL,
    subprograma_id int NOT NULL,
    PRIMARY KEY(id_semestre),
    FOREIGN KEY(subprograma_id) REFERENCES subprograma(id_subprograma)
);

CREATE TABLE subproyectos(
    id_subproyectos int AUTO_INCREMENT,
    n_horas int NOT NULL,
    nombre_subproyecto VARCHAR(50),
    semestre_id int NOT NULL,
    PRIMARY KEY(id_subproyectos),
    FOREIGN KEY(semestre_id) REFERENCES semestre(id_semestre)
);

CREATE TABLE aula(
    id_aula int AUTO_INCREMENT,
    localizacion VARCHAR(50) NOT NULL,
    tipo VARCHAR(50),
    nombre_aula VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_aula)
);

CREATE TABLE horario(
    id_horario int AUTO_INCREMENT,
    subprograma_id int NOT NULL,
    aula_id int NOT NULL,
    PRIMARY KEY(id_horario),
    FOREIGN KEY(subprograma_id) REFERENCES subprograma(id_subprograma),
    FOREIGN KEY(aula_id) REFERENCES aula(id_aula)
);