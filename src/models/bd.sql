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

