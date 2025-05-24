SET search_path TO funcionarios_estaduais;

SHOW search_path;

CREATE OR REPLACE FUNCTION contaFaltaNaoJust(cpf_falta VARCHAR(11))
RETURNS INTEGER AS $$
DECLARE
    num_faltas INTEGER;
BEGIN
    SELECT COUNT(*) INTO num_faltas
    FROM funcionarios_estaduais.conta_falta
    WHERE cpf = cpf_falta AND justificativa IS NULL;

    RETURN num_faltas;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION analisa_faltas()
    RETURNS trigger AS $$
DECLARE
    num_faltas INTEGER;
    limite_faltas INTEGER := 5;
BEGIN
    num_faltas := contaFaltaNaoJust(NEW.cpf);
IF num_faltas >= limite_faltas THEN
    UPDATE funcionarios_estaduais.funcionario
    SET ativo = 'N'
    WHERE cpf = NEW.cpf;
END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER verifica_faltas
AFTER INSERT OR UPDATE ON funcionarios_estaduais.conta_falta
FOR EACH ROW
EXECUTE PROCEDURE analisa_faltas();
