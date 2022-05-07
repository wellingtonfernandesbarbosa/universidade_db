CREATE DATABASE IF NOT EXISTS universidade_db;

USE universidade_db;

CREATE TABLE IF NOT EXISTS aluno (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) NOT NULL,
    endereco VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS professor (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) NOT NULL,
    salario DECIMAL(6,2) NOT NULL,
    carga_horaria INT NOT NULL
);

CREATE TABLE IF NOT EXISTS curso (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    curso VARCHAR(100) NOT NULL,
    professor INT NOT NULL,
    cargaHoraria INT NOT NULL,
    
    CONSTRAINT `FK_professor` FOREIGN KEY (`professor`) 
    REFERENCES `professor` (`id`) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS matricula (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    aluno INT NOT NULL,
    curso INT NOT NULL,
    dataMatricula DATE NOT NULL,
    
    CONSTRAINT `FK_aluno` FOREIGN KEY (`aluno`) 
    REFERENCES `aluno` (`id`) ON DELETE RESTRICT,
    
    CONSTRAINT `FK_curso` FOREIGN KEY (`curso`) 
    REFERENCES `curso` (`id`) ON DELETE RESTRICT
);
