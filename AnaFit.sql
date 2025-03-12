-- Criando banco de dados
CREATE DATABASE anafit;

-- Criando primeira tabela
CREATE TABLE  cliente(
cpf BIGINT PRIMARY KEY,
primeironome VARCHAR(50) NOT NULL,
sobrenome VARCHAR(50) NOT NULL,
datanasc DATE NOT NULL,
peso DECIMAL(5,2),
altura FLOAT,
whatsapp VARCHAR(15) NOT NULL,
email VARCHAR(100) UNIQUE,
rua VARCHAR(100) NOT NULL,
numero INT(6) NOT NULL,
complemento VARCHAR(100),
cep VARCHAR(8)
);

-- INSERINDO DADOS NA TABELADE CLIENTES
INSERT INTO cliente(cpf, primeironome, sobrenome, datanasc, peso, altura, whatsapp, email, rua, numero, complemento, cep)
VALUES(1234568910, "Guilherme Francisco", "Almeida", "1998-05-23",80.50, 1.75, "+5511934258938","guilherme.falmeida7@senacsp.edu.br","Rua Alessandro Buri", 357,"", "04890050") ;

CREATE TABLE treino(
diadasemana DATE NOT NULL,
horario TIME NOT NULL,
tipo VARCHAR(20) NOT NULL
);

-- INSERINDO DADOS NA TABELADE TREINO
INSERT INTO treino(diadasemana,horario,tipo)
VALUES("2025-03-11","14:20","Superior"),
        ("2025-03-12","22:30", "Inferior");


--DELETANDO OS TODOS REGISTROS DA TABELA
DELETE FROM treino;    

DELETE FROM cliente;

DELETE FROM anafit;

--DELETANDO UM DADO/REGISTRO ESPECÍFICO
DELETE FROM treino WHERE tipo = "Superior";

DELETE FROM treino WHERE horario = "14:30";

DELETE FROM treino WHERE diadasemana = "2025-03-11";

-- deletar uma tabela
DROP TABLE treino;

DROP TABLE cliente;

DROP DATABASE anafit;

