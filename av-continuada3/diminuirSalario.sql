CREATE OR REPLACE FUNCTION diminuirSalario(func_cpf VARCHAR(11), percentual INTEGER)
RETURNS void AS $$
BEGIN
    UPDATE funcionarios_estaduais.funcionario
    SET salario = salario - (salario * (percentual * 0.01))
    WHERE cpf = func_cpf;
END;
$$ LANGUAGE plpgsql;