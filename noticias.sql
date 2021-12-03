DROP DATABASE IF EXISTS Noticias;
CREATE DATABASE Noticias;
USE Noticias;
----------------------------------
CREATE TABLE Categoria(
    Id INT AUTO_INCREMENT,
    IdCategoria INT NOT NULL,
    IdEditor INT NOT NULL,
    Fecha DATETIME NOT NULL,
    Lugar VARCHAR(30) NOT NULL,
    Contenido TEXT NOT NULL,

    PRIMARY KEY (Id)
);

CREATE TABLE Noticia(
    Id INT AUTO_INCREMENT,
    Nombre VARCHAR(30),

    PRIMARY KEY (Id)
);

CREATE TABLE Editor(
    Id INT AUTO_INCREMENT,
    Nombre VARCHAR(30) NOT NULL,
    Correo VARCHAR(50) NOT NULL,
    Contrasena CHAR(64) NOT NULL,

    PRIMARY KEY (Id)
);

