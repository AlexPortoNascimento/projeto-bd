SET search_path TO funcionarios_estaduais;
SHOW search_path;


SELECT *
FROM funcionario;

SELECT nome, salario, cpf
FROM funcionario
WHERE salario > 3000.00;

SELECT nome, cpf, salario
FROM funcionario
WHERE cpf = '12345678901';

SELECT diminuirSalario('12345678901', 10);

SELECT *
FROM conta_falta;

INSERT INTO funcionarios_estaduais.conta_falta (cpf, data, justificativa)