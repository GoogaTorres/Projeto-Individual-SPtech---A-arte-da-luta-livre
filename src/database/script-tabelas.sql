-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE aquatech;

USE aquatech;

CREATE TABLE empresa (
	id INT PRIMARY KEY AUTO_INCREMENT,
	razao_social VARCHAR(50),
	cnpj CHAR(14),
	codigo_ativacao VARCHAR(50)
);

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

ALTER TABLE usuario ADD COLUMN cpf CHAR(11);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
);

insert into empresa (razao_social, codigo_ativacao) values ('Empresa 1', 'ED145B');
insert into empresa (razao_social, codigo_ativacao) values ('Empresa 2', 'A1B2C3');
insert into aquario (descricao, fk_empresa) values ('Aquário de Estrela-do-mar', 1);
insert into aquario (descricao, fk_empresa) values ('Aquário de Peixe-dourado', 2);

INSERT INTO medida (dht11_umidade, dht11_temperatura, luminosidade, lm35_temperatura, chave, momento, fk_aquario) VALUES
(4.1, 6.1, 6.0, 10.2, 1, '2026-05-08 12:00:00', 1),
(8.1, 12.1, 12.0, 20.2, 1, '2026-05-09 18:30:00', 1);

SELECT * FROM usuario;



CREATE DATABASE wrestling;
USE wrestling;

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nomeUsuario VARCHAR(45),
email VARCHAR(45), 
genero VARCHAR(45),
senha VARCHAR(45),
lutadorFavorito VARCHAR(45),
liga VARCHAR(45)
);

CREATE TABLE quiz (
	idQuiz INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

CREATE TABLE quizRealizado (
	idQuizRealizado INT AUTO_INCREMENT,
		CONSTRAINT pkIdQuizRealizado PRIMARY KEY (idQuizRealizado, fkUsuario, fkQuiz),
	fkUsuario INT,
		CONSTRAINT const_fkUsuario FOREIGN KEY (fkUsuario) REFERENCES usuario(id),
	fkQuiz INT,
		CONSTRAINT const_fkQuiz FOREIGN KEY (fkQuiz) REFERENCES quiz(idQuiz),
	pontuacao INT,
	dataHora DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO quiz (nome) VALUES (
	'Quiz da luta-livre'
);

SELECT usuario.nomeUsuario, quizRealizado.pontuacao, dataHora FROM quizRealizado JOIN usuario ON quizRealizado.fkUsuario = usuario.id;

SELECT * FROM quizRealizado;

SELECT COUNT(idQuizRealizado) FROM quizRealizado;

SELECT * FROM quiz;

SELECT COUNT(idQuiz) FROM quiz;

SELECT * FROM usuario;

SELECT COUNT(idQuizRealizado) AS 'quizes_realizados' FROM quizRealizado;

SELECT COUNT(id) FROM usuario;

SELECT liga, COUNT(genero) AS 'contagem' FROM usuario WHERE genero = 'masculino' GROUP BY liga ORDER BY liga DESC;
SELECT liga, COUNT(genero) AS 'contagem' FROM usuario WHERE genero = 'feminino' GROUP BY liga ORDER BY liga DESC;

SELECT liga, (SELECT COUNT(genero) FROM usuario WHERE genero = 'feminino' GROUP BY liga) as 'feminino', (SELECT COUNT(genero) FROM usuario WHERE genero = 'masculino' GROUP BY liga) AS 'masculino'
FROM usuario GROUP BY liga ORDER BY liga;

SELECT COUNT(id) AS 'Contagem' FROM usuario WHERE liga = 'WWE' AND genero = 'masculino';
SELECT COUNT(id) FROM usuario WHERE liga = 'WWE' AND genero = 'feminino';

SELECT COUNT(id) FROM usuario WHERE liga = 'AEW' AND genero = 'masculino';
SELECT COUNT(id) FROM usuario WHERE liga = 'AEW' AND genero = 'feminino';

SELECT COUNT(id) FROM usuario WHERE liga = 'TNA' AND genero = 'masculino';
SELECT COUNT(id) FROM usuario WHERE liga = 'TNA' AND genero = 'feminino';

SELECT COUNT(id) FROM usuario WHERE liga = 'NJPW' AND genero = 'masculino';
SELECT COUNT(id) FROM usuario WHERE liga = 'NJPW' AND genero = 'feminino';

SELECT COUNT(id) FROM usuario WHERE liga = 'BWF' AND genero = 'masculino';
SELECT COUNT(id) FROM usuario WHERE liga = 'BWF' AND genero = 'feminino';

SELECT COUNT(id) FROM usuario WHERE liga = 'WCW' AND genero = 'masculino';
SELECT COUNT(id) FROM usuario WHERE liga = 'WCW' AND genero = 'feminino';