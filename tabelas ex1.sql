create database exercicio1;
use exercicio1;

-- drop database exercicio1

CREATE TABLE permissao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100),
    nivel int
);

CREATE TABLE funcionario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(50) NOT NULL,
    permissao int NOT NULL,
    FOREIGN KEY (permissao) REFERENCES permissao(id)
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    disponivel VARCHAR(50) NOT NULL,
    quem_cadastrou int NOT NULL,
    FOREIGN KEY (quem_cadastrou) REFERENCES funcionario(id)
);

CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
	produto_vendido int NOT NULL,
    quem_vendeu int NOT NULL,
    qtd_vendida int not null,
    FOREIGN KEY (produto_vendido) REFERENCES produtos(id),
    FOREIGN KEY (quem_vendeu) REFERENCES funcionario(id)
);

CREATE TABLE log (
    id INT AUTO_INCREMENT PRIMARY KEY,
	mensagem varchar(255) NOT NULL
);

CREATE TABLE acesso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idfunc INT NOT NULL,
	stat BOOLEAN NOT NULL,
    FOREIGN KEY (idfunc) REFERENCES funcionario(id)
);