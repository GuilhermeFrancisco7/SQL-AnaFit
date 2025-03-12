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

-- INSERT INTO - Criando novos registros
INSERT INTO cliente(cpf, primeironome, sobrenome, datanasc, peso, altura, whatsapp, email, rua, numero, complemento, cep)
VALUES
(12345678911, 'João', 'Silva', '1990-05-15', 72.30, 1.80, '+5511998765432', 'joao.silva@email.com', 'Rua das Flores', 120, 'Api 301', '01234000'),
(12345678912, 'Maria', 'Oliveira', '1985-10-22', 58.00, 1.65, '+5511987654321', 'maria.oliveira@email.com', 'Avenida Paulista', 1000, 'Bloco B', '01310000'),
(12345678913, 'Carlos', 'Pereira', '1995-07-30', 85.50, 1.90, '+5511987432123', 'carlos.pereira@email.com', 'Rua dos Três Corações', 350, NULL, '01453000'),
(12345678914, 'Beatriz', 'Santos', '2000-02-10', 50.70, 1.70, '+5511976543210', 'beatriz.santos@email.com', 'Rua da Paz', 555, 'Sala 502', '02540000'),
(12345678915, 'Lucas', 'Costa', '1992-11-05', 77.40, 1.78, '+551198764321', 'lucas.costa@email.com', 'Praça da Liberdade', 300, NULL, '03120000');

-- Criando uma nova tabela para pagamento
CREATE TABLE pagamento(
id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
valor DECIMAL(5,2) NOT NULL,
data_pagamento DATE NOT NULL,
cpf BIGINT,
FOREIGN KEY (cpf) REFERENCES cliente(cpf)
);

-- Inserindo registros para pagamento
INSERT INTO pagamento(valor, data_pagamento, cpf)
VALUES
(150.00, "2025-03-01", 12345678911), --pagamento de João
(200.00, "2025-03-05", 12345678912), --pagamento de Maria
(300.00, "2025-03-10", 12345678913), --pagamento de Carlos
(250.00, "2025-03-02", 12345678911), --pagamento de João
(100.00, "2025-03-03", 12345678915); --pagamento de Lucas 
-- Alterar registros de uma linha
UPDATE treino
SET diadasemana = "2025-03-14"
WHERE tipo = "Superior" AND diadasemana = "2025-03-12";


-- Alterar o registro em duas Linhas ao mesmo tempo
UPDATE treino
SET horario = "15:00:00" 
WHERE horario in ("14:20", "22:30");

-- Alterando registros de Peso e data Nascimento na tabela cliente
UPDATE cliente
SET peso = 66.50, datanasc = "2000-09-17"
WHERE cpf = 1234568910;

-- READ - Selecionando todos os dados da tabela
SELECT * FROM treino;

-- READ - Selecionando apenas uma coluna e mostrando os dados dela
SELECT tipo FROM treino;

-- READ - Selecionando duas colunas ao mesmo tempo
SELECT diadasemana, horario FROM treino;


-- Selecionando valores entre dois dado
SELECT * FROM cliente
WHERE datanasc BETWEEN "1992-01-01" AND "2000-12-31";

SELECT * FROM cliente
WHERE peso BETWEEN 66.50 AND 100;

SELECT * FROM cliente
WHERE peso = 66 OR PESO =  100;

-- SOMAR todos os pesos do registro
SELECT SUM(PESO) AS soma_peso FROM cliente;

--Contar quantos registros eu tenho na tabela de clientes
SELECT COUNT(*) AS total_registros FROM cliente;

-- Selecinando alturas maior que e menor que
SELECT * FROM cliente
WHERE altura > 1.78;

SELECT * FROM cliente
WHERE altura < 1.70;

-- INNER JOIN (Select com chave estrangeira)
SELECT
    c.cpf,
    c.primeironome,
    c.sobrenome,
    p.valor,
    p.data_pagamento
FROM
    cliente c
INNER JOIN
    pagamento p ON C.cpf = p.cpf
WHERE
    c.cpf = 12345678911;
    
--Combinando maior que e menor que
SELECT * From cliente
WHERE altura > 1.78 OR altura < 1.70;

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


