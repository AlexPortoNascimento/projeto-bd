CREATE TABLE funcionarios_estaduais.funcionario (

nome VARCHAR( 60 ) NOT NULL,
email VARCHAR( 60 ) NOT NULL, 
sexo VARCHAR( 10 ) NOT NULL,
ddd CHAR( 2 ),
salario DECIMAL (8,2),
telefone VARCHAR ( 8 ),
ativo VARCHAR(1),
endereco VARCHAR( 70 ) NOT NULL,
cpf VARCHAR (11) NOT NULL,
cidade VARCHAR( 20 ) NOT NULL,
estado VARCHAR( 2 ) NOT NULL,
bairro VARCHAR( 20 ) NOT NULL,
pais VARCHAR( 20 ) NOT NULL,
login VARCHAR( 12 ) NOT NULL,
senha VARCHAR( 12 ) NOT NULL,
news VARCHAR( 8 ),
id SERIAL PRIMARY KEY
);

CREATE TABLE funcionarios_estaduais.conta_falta (
    cpf VARCHAR(11),
    data DATE,
    justificativa TEXT,
    PRIMARY KEY (cpf, data),
    FOREIGN KEY (cpf) REFERENCES funcionarios_estaduais.funcionario (cpf)
);
