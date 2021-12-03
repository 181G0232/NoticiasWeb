DROP DATABASE IF EXISTS Noticias;
CREATE DATABASE Noticias;
USE Noticias;

----------------------------------

CREATE TABLE Noticia(
    Id INT AUTO_INCREMENT,
    IdCategoria INT NOT NULL,
    IdEditor INT NOT NULL,
    Titulo VARCHAR(50) NOT NULL,
    Fecha DATETIME NOT NULL,
    Contenido TEXT NOT NULL,

    PRIMARY KEY (Id)
);

CREATE TABLE Categoria(
    Id INT AUTO_INCREMENT,
    Nombre VARCHAR(30),

    PRIMARY KEY (Id)
);

CREATE TABLE Rol(
    Id INT AUTO_INCREMENT,
    Nombre VARCHAR(30) NOT NULL,

    PRIMARY KEY (Id)
);

CREATE TABLE Editor(
    Id INT AUTO_INCREMENT,
    IdRol INT NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Correo VARCHAR(50) NOT NULL,
    Contrasena CHAR(64) NOT NULL,

    PRIMARY KEY (Id)
);

------------------------------------

ALTER TABLE Noticia ADD(
    CONSTRAINT FKNoticiaCategoria
        FOREIGN KEY (IdCategoria)
        REFERENCES Categoria(Id),
    CONSTRAINT FKNoticiaEditor
        FOREIGN KEY (IdEditor)
        REFERENCES Editor(Id)
);

ALTER TABLE Editor ADD(
    CONSTRAINT FKEditorRol
        FOREIGN KEY (IdRol)
        REFERENCES Rol(Id)
);