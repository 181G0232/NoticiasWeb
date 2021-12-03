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

CREATE TABLE Editor(
    Id INT AUTO_INCREMENT,
    Nombre VARCHAR(30) NOT NULL,
    Correo VARCHAR(50) NOT NULL,

    PRIMARY KEY (Id)
);

CREATE TABLE Administrador(
    Id INT AUTO_INCREMENT,
    Nombre VARCHAR(30) NOT NULL,
    Contrasena CHAR(64) NULL,

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

---------------------------------------------------------------

INSERT INTO Categoria(Nombre) VALUES 
    ("Android"),
    ("IOS"),
    ("Windows"),
    ("Linux"),
    ("Google"),
    ("AMD"),
    ("Intel"),
    ("Microsoft"),
    ("Xbox"),
    ("Software"),
    ("Hardware"),
    ("Meta"),
    ("VR"),
    ("AR");

INSERT INTO Editor(Nombre, Correo) VALUES 
    ("Juan Chavez", "181G0232@rcarbonifera.tecnm.mx"),
    ("Jean Muñoz", "181G0250@rcarbonifera.tecnm.mx");

INSERT INTO Administrador(Nombre, Contrasena) VALUES 
    ("ADMIN", "FC8252C8DC55839967C58B9AD755A59B61B67C13227DDAE4BD3F78A38BF394F7");