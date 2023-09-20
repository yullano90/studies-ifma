-- ===============================================================================================================================
-- ATV_03_UC_03 PARTE_2

-- Crie uma coluna “em atividade” com o tipo “bit” na tabela médicos, onde o “0” (zero) representa o “não” e o “1” representa o sim. 
-- Crie o comando SQL para atualizar ao menos dois smédicos com “não” e o restante com “sim”:
ALTER TABLE Medico ADD EM_ATIVIDADE bit AFTER ENDERECO;
UPDATE Medico SET EM_ATIVIDADE = 0 WHERE ID_MEDICO = 1 OR ID_MEDICO = 2;
UPDATE Medico SET EM_ATIVIDADE = 1 WHERE ID_MEDICO BETWEEN 3 AND 10;


-- Crie um comando SQL para atualizar as datas de alta nas internações em quartos de enfermaria para três dias após a entrada:
UPDATE Internacao SET ALTA_EFEVTIVA = DATE_ADD(DATA_ENTRADA,INTERVAL 3 DAY) WHERE ID_QUARTO = 1; 

-- Crie um comando SQL para excluir o último convênio cadastrado e todas as consultas realizadas com esse convênio (delete cascade):
-- Não é possível dropar o registro ID_CONVENIO = 4 da Tabela "Convenio", devido a INTEGRIDADE REFERENCIAL!!!

-- Sendo assim, dropei as FK's das TABELAS IMPACTADAS pela deleção do registro ID_CONVENIO = 4 da Tabela "Convenio":
ALTER TABLE db_hospital_iulano.Consulta DROP CONSTRAINT FK_CONVENIO;
ALTER TABLE db_hospital_iulano.Consulta DROP CONSTRAINT FK_PACIENTE;
ALTER TABLE db_hospital_iulano.Internacao DROP CONSTRAINT FK_CONVENIO_;
ALTER TABLE db_hospital_iulano.Paciente DROP CONSTRAINT PK_CONVENIO;

-- Refiz as duas FK's COM DELETE CASCADE:
ALTER TABLE  db_hospital_iulano.consulta 
ADD CONSTRAINT FK_CONVENIO FOREIGN KEY (ID_CONVENIO) 
REFERENCES Convenio (ID_CONVENIO) ON DELETE CASCADE;

ALTER TABLE  db_hospital_iulano.consulta 
ADD CONSTRAINT FK_PACIENTE FOREIGN KEY (ID_CONVENIO) 
REFERENCES Convenio (ID_CONVENIO) ON DELETE CASCADE;

ALTER TABLE  db_hospital_iulano.Internacao 
ADD CONSTRAINT FK_CONVENIO_ FOREIGN KEY (ID_CONVENIO) 
REFERENCES Convenio (ID_CONVENIO) ON DELETE CASCADE;

ALTER TABLE  db_hospital_iulano.Paciente 
ADD CONSTRAINT PK_CONVENIO FOREIGN KEY (ID_CONVENIO) 
REFERENCES Convenio (ID_CONVENIO) ON DELETE CASCADE;

-- E então a deleção ocorre com sucesso em cascata se propagando nas duas tabelas:
DELETE FROM db_hospital_iulano.convenio WHERE ID_CONVENIO = 4;

