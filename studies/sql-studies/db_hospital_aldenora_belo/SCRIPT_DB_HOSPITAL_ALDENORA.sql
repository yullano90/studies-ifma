  -- ===============================================================================================================================
  -- ATV_02_UC_03

  CREATE DATABASE DB_HOSPITAL_IULANO;
  USE DB_HOSPITAL_IULANO;

  CREATE TABLE DB_HOSPITAL_IULANO.Convenio (
    ID_CONVENIO INT NOT NULL AUTO_INCREMENT,
    VALOR FLOAT NOT NULL,
    TEMPO_CARENCIA INT NOT NULL,
    NOME_OPERADORA VARCHAR(45) NOT NULL,

    PRIMARY KEY (ID_CONVENIO)
  );


  CREATE TABLE DB_HOSPITAL_IULANO.Paciente (
    ID_PACIENTE INT NOT NULL AUTO_INCREMENT,
    ID_CONVENIO INT NOT NULL ,
    NOME VARCHAR(45) NOT NULL,
    NASC DATE NOT NULL,
    ENDERECO VARCHAR(45) NOT NULL,
    TELEFONE VARCHAR(12) NOT NULL,
    EMAIL VARCHAR(20) NOT NULL,
    CPF CHAR(11) NOT NULL,
    RG VARCHAR(15) NOT NULL,
      
    PRIMARY KEY (ID_PACIENTE),
    INDEX PK_CONVENIO_idx (ID_CONVENIO ASC) VISIBLE,
    CONSTRAINT PK_CONVENIO
      FOREIGN KEY (ID_CONVENIO)
    REFERENCES DB_HOSPITAL_IULANO.Convenio(ID_CONVENIO)
  );


  CREATE TABLE DB_HOSPITAL_IULANO.Medico(
    ID_MEDICO INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(45) NOT NULL,
    CRM VARCHAR(12) NOT NULL,
    UF_CRM VARCHAR(2) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    DATA_NASC DATE NOT NULL,
    TELEFONE VARCHAR(12) NOT NULL,
    ENDERECO VARCHAR(45) NOT NULL,

      PRIMARY KEY (ID_MEDICO)
  );


  CREATE TABLE DB_HOSPITAL_IULANO.Especialidade (
    ID_ESPECIALIDADE INT NOT NULL AUTO_INCREMENT,
    ESPECIALIDADE VARCHAR(45) NOT NULL,
    VALOR_ESPECIALIDADE FLOAT NOT NULL,

    PRIMARY KEY (ID_ESPECIALIDADE)
  );



  CREATE TABLE DB_HOSPITAL_IULANO.Quarto (
    ID_QUARTO INT NOT NULL AUTO_INCREMENT,
    TIPO_QUARTO VARCHAR(45) NOT NULL,
    VALOR_DIARIA FLOAT NOT NULL,
    DESCRICAO VARCHAR(155) NOT NULL,

    PRIMARY KEY (ID_QUARTO)
  );


  CREATE TABLE DB_HOSPITAL_IULANO.enfermeiro (
    ID_ENFERMEIRO INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(45) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    COREN VARCHAR(18) NOT NULL,

    PRIMARY KEY (ID_ENFERMEIRO)
  );


  CREATE TABLE DB_HOSPITAL_IULANO.Medico_Especialidade (
    ID_MEDICO INT NOT NULL,
    ID_ESPECIALIDADE INT NOT NULL,

    PRIMARY KEY (ID_MEDICO, ID_ESPECIALIDADE),
    INDEX fk_Medico_has_Especialidade_Especialidade1_idx (ID_ESPECIALIDADE ASC) VISIBLE,
    INDEX fk_Medico_has_Especialidade_Medico1_idx (ID_MEDICO ASC) VISIBLE,

    CONSTRAINT fk_Medico_has_Especialidade_Medico1
      FOREIGN KEY (ID_MEDICO)
      REFERENCES DB_HOSPITAL_IULANO.Medico (ID_MEDICO),
      
    CONSTRAINT fk_Medico_has_Especialidade_Especialidade1
      FOREIGN KEY (ID_ESPECIALIDADE)
      REFERENCES DB_HOSPITAL_IULANO.Especialidade (ID_ESPECIALIDADE)
  );


  CREATE TABLE DB_HOSPITAL_IULANO.Internacao (
    ID_INTERNACAO INT NOT NULL AUTO_INCREMENT,
    DATA_ENTRADA DATETIME NOT NULL,
    PREVISAO_ALTA DATETIME NOT NULL,
    ALTA_EFETIVA DATETIME NOT NULL,
    PROCEDIMENTOS VARCHAR(255) NULL,
    ID_QUARTO INT NOT NULL,
    ID_PACIENTE INT NOT NULL,
    ID_ENFERMEIRO INT NOT NULL,
    ID_CONVENIO INT NOT NULL,

    PRIMARY KEY (ID_INTERNACAO),
    INDEX FK_QUARTO_idx (ID_QUARTO ASC) VISIBLE,
    INDEX FK_PACIENTE_idx (ID_PACIENTE ASC) VISIBLE,
    INDEX FK_ENFERMEIRO_idx (ID_ENFERMEIRO ASC) VISIBLE,
    INDEX FK_CONVENIO_idx (ID_CONVENIO ASC) VISIBLE,

    CONSTRAINT FK_QUARTO
      FOREIGN KEY (ID_QUARTO)
      REFERENCES DB_HOSPITAL_IULANO.Quarto (ID_QUARTO),
      
    CONSTRAINT FK_PACIENTE_
      FOREIGN KEY (ID_PACIENTE)
      REFERENCES DB_HOSPITAL_IULANO.Paciente (ID_PACIENTE),
      
    CONSTRAINT FK_ENFERMEIRO_
      FOREIGN KEY (ID_ENFERMEIRO)
      REFERENCES DB_HOSPITAL_IULANO.enfermeiro (ID_ENFERMEIRO),
      
    CONSTRAINT FK_CONVENIO_
      FOREIGN KEY (ID_CONVENIO)
      REFERENCES DB_HOSPITAL_IULANO.Convenio (ID_CONVENIO)
  );


  CREATE TABLE DB_HOSPITAL_IULANO.Consulta (
    ID_CONSULTA INT NOT NULL AUTO_INCREMENT,
    DATA_HORA DATETIME NOT NULL,
    OBS_MEDICO VARCHAR(255),
    ID_MEDICO INT NOT NULL,
    ID_PACIENTE INT NOT NULL,
    ID_ESPECIALIDADE INT NOT NULL,
    ID_CONVENIO INT,
    
    PRIMARY KEY (ID_CONSULTA),
    INDEX FK_MEDICO_idx (ID_MEDICO ASC) VISIBLE,
    INDEX FK_PACIENTE_idx (ID_PACIENTE ASC) VISIBLE,
    INDEX FK_CONVENIO_idx (ID_CONVENIO ASC) VISIBLE,
    INDEX FK_ESPECIALIDADE_idx (ID_ESPECIALIDADE ASC) VISIBLE,
    
    CONSTRAINT FK_MEDICO
    FOREIGN KEY (ID_MEDICO)
    REFERENCES DB_HOSPITAL_IULANO.Medico (ID_MEDICO),
      
      
    -- Chave estrangeira PACIENTE
      CONSTRAINT FK_PACIENTE
      FOREIGN KEY (ID_PACIENTE)
      REFERENCES DB_HOSPITAL_IULANO.Paciente (ID_PACIENTE),

    -- Chave estrangeira CONVENIO
      CONSTRAINT FK_CONVENIO
      FOREIGN KEY (ID_CONVENIO)
      REFERENCES DB_HOSPITAL_IULANO.Convenio (ID_CONVENIO),
      
    -- Chave estrangeira ESPECIALIDADE
      CONSTRAINT FK_ESPECIALIDADE
      FOREIGN KEY (ID_ESPECIALIDADE)
      REFERENCES DB_HOSPITAL_IULANO.Especialidade (ID_ESPECIALIDADE)
  );



  -- ===============================================================================================================================
  -- ATV_03_UC_03 PARTE_1

  USE DB_HOSPITAL_IULANO;

  -- Inclua ao menos dez médicos;
  INSERT INTO Medico (NOME, CRM, UF_CRM, CPF, DATA_NASC, TELEFONE, ENDERECO) VALUES
  ('IULANO SANTOS', 'CRM/MA112233' , 'MA', '00011122233', '1970-01-12', '55911223344','Rua 10, Planta Tower, Piso 10, Sala 10'),
  ('JHONATAN FRAGA','CRM/RS223344' , 'RS', '11122233344', '1960-01-12', '55922334455','Rua 09, Senac Tower, Piso 09, Sala 09'),
  ('DANIEL SANTOS', 'CRM/SP334455' , 'SP', '22233344455', '1950-01-12', '55933445566','Rua 08, Dubai Tower, Piso 06, Sala 08'),
  ('PEDRO MESQUITA', 'CRM/PI445566' , 'PI', '33344455566', '1940-01-12', '55944556677','Rua 07, Globo Tower, Piso 07, Sala 07'),
  ('CARLOS ALBERTO', 'CRM/CE445566' , 'CE', '44455566677', '1930-01-12', '55955667788','Rua 06, Globo Tower, Piso 06, Sala 06'),
  ('MARCELO SANTOS', 'CRM/BA445566' , 'BA', '55566677788', '1920-01-12', '55966778899','Rua 05, Globo Tower, Piso 05, Sala 05'),
  ('KEYLA CAMPOS', 'CRM/PA445566' , 'PA', '77788899900', '1910-01-12', '55977889900','Rua 04, Globo Tower, Piso 04, Sala 04'),
  ('FRANCISCO PEREIRA', 'CRM/SE445566' , 'SE', '88899900011', '1800-01-12', '55977889900','Rua 03, Globo Tower, Piso 03, Sala 03'),
  ('ANA MARIA BRAGA', 'CRM/PE445566' , 'PE', '99900011122', '1810-01-12', '55977889900','Rua 02, Globo Tower, Piso 02, Sala 02'),
  ('RAFAEL ROCHA', 'CRM/AL445566' , 'AL', '99900099900', '1820-01-12', '55977889900','Rua 01, Globo Tower, Piso 01, Sala 01');


  -- Inclua ao menos sete especialidades 
  -- (considere a afirmação de que “entre as especialidades há pediatria, clínico geral, gastroenterologia e dermatologia”)
  INSERT INTO Especialidade (ESPECIALIDADE, VALOR_ESPECIALIDADE) VALUES
  ('CLINICO GERAL', 177.99), 
  ('PEDIATRIA', 94.50), 
  ('GASTROENTEROLOGIA', 210.45), 
  ('DERMATOLOGIA', 167.89), 
  ('FONOALDIOLOFIA', 180.00), 
  ('ANGEOLOGIA', 259.22), 
  ('PSIQUIATRIA', 299.99);


  -- Inclua ao menos quatro convênios médicos
  INSERT INTO Convenio (VALOR , TEMPO_CARENCIA , NOME_OPERADORA ) VALUES
  (109.99, 5, 'ATHENA SAUDE'), 
  (114.99, 4, 'SENAC CARE'), 
  (149.99, 6, 'PANDAS HEALTH'), 
  (99.99, 3, 'VIDAS MEDICARE');


  -- Inclua ao menos dez pacientes | associe ao menos cinco pacientes e cinco consultas a convênios existentes
  INSERT INTO Paciente ( ID_CONVENIO, NOME, NASC, ENDERECO, TELEFONE, EMAIL, CPF, RG) VALUES
  (1, 'CHICO PINHEIRO', '1910-01-12', 'Rua da Sopa, Centro, Nª 10', '98911223310', 'chico@mysql.com', '99988877766', '01112233344445'),
  (1, 'SANDRA ANNEMBERG', '1910-01-12', 'Rua da Torta, Centro, Nª 09', '98911223309', 'sandra@mysql.com', '99988877766', '01112233344445'),
  (2, 'MAJU COUTINHO', '1910-01-12', 'Rua da Pizza, Centro, Nª 08', '98911223308', 'maju@mysql.com', '99988877766', '01112233344445'),
  (2, 'CESAR TRALLI', '1910-01-12', 'Rua da Feijoada, Centro, Nª 07', '98911223307', 'cesar@mysql.com', '99988877766', '01112233344445'),
  (3, 'WILLIAM BONNER', '1910-01-12', 'Rua da Macarronada, Centro, Nª 06', '98911223306', 'william@mysql.com', '99988877766', '01112233344445'),
  (3, 'FATIMA BERNARDES', '1910-01-12', 'Rua da Sobremesa, Centro, Nª 05', '98911223305', 'fatima@mysql.com', '99988877766', '01112233344445'),
  (4, 'FAUSTO SILVA', '1910-01-12', 'Rua da Canjica, Centro, Nª 04', '98911223304', 'fausto@mysql.com', '99988877766', '01112233344445'),
  (4, 'LUCIANO HUCK', '1910-01-12', 'Rua da Tapioca, Centro, Nª 03', '98911223303', 'luciano@mysql.com', '99988877766', '01112233344445'),
  (4, 'SERGIO GROISMAN', '1910-01-12', 'Rua da Farinha, Centro, Nª 02', '98911223302', 'sergio@mysql.com', '99988877766', '01112233344445'),
  (4, 'MARCOS MION', '1910-01-12', 'Rua da Caranguejada, Centro, Nª 01', '98911223301', 'marcos@mysql.com', '99988877766', '01112233344445');


  -- Inclua dez consultas de diferentes pacientes e diferentes médicos (alguns pacientes realizam mais que uma consulta).
  -- Associe ao menos cinco pacientes e cinco consultas a convênios existentes
  -- As consultas devem ter ocorrido entre 01/01/2017 e 31/12/2022.
  INSERT INTO Consulta (DATA_HORA, ID_MEDICO, ID_PACIENTE, ID_ESPECIALIDADE, ID_CONVENIO, OBS_MEDICO) VALUES
  (STR_TO_DATE('01/01/2017 07:35', '%d/%m/%Y %H:%i'), 1, 1, 1, 1, 'PACIENTE DEVE RESPOUSAR E TOMAR AZITROMICINA'),
  (STR_TO_DATE('01/02/2018 08:35', '%d/%m/%Y %H:%i'), 2, 2, 2, 2, 'PACIENTE DEVE FAZER NEBULIZAÇÃO COM AEROLIM'),
  (STR_TO_DATE('01/03/2020 09:35', '%d/%m/%Y %H:%i'), 3, 3, 3, 3, 'PACIENTE DEVE TOMAR CAPITOPRIL 2X AO DIA'),
  (STR_TO_DATE('01/04/2020 10:35', '%d/%m/%Y %H:%i'), 4, 4, 4, 4, 'PACIENTE DEVE TOMAR RESFENOL A CADA 6 HORAS'),
  (STR_TO_DATE('01/05/2020 11:35', '%d/%m/%Y %H:%i'), 5, 5, 5, 1, 'PACIENTE DEVE TOMAR DIPIRONA 15 GOTAS POR DIA'),
  (STR_TO_DATE('01/01/2017 07:35', '%d/%m/%Y %H:%i'), 1, 1, 3, 1, 'PACIENTE DEVE RESPOUSAR E TOMAR AZITROMICINA'),
  (STR_TO_DATE('01/02/2018 08:35', '%d/%m/%Y %H:%i'), 2, 2, 2, 2, 'PACIENTE DEVE FAZER NEBULIZAÇÃO COM AEROLIM'),
  (STR_TO_DATE('01/03/2020 09:35', '%d/%m/%Y %H:%i'), 3, 3, 3, NULL, 'PACIENTE DEVE TOMAR CAPITOPRIL 2X AO DIA'),
  (STR_TO_DATE('01/04/2020 10:35', '%d/%m/%Y %H:%i'), 4, 4, 3, NULL, 'PACIENTE DEVE TOMAR RESFENOL A CADA 6 HORAS'),
  (STR_TO_DATE('01/05/2020 11:35', '%d/%m/%Y %H:%i'), 5, 5, 5, 1, 'PACIENTE DEVE TOMAR DIPIRONA 15 GOTAS POR DIA'),
  (STR_TO_DATE('01/08/2020 12:35', '%d/%m/%Y %H:%i'), 6, 6, 6, 2, ''),
  (STR_TO_DATE('01/09/2020 13:35', '%d/%m/%Y %H:%i'), 7, 7, 7, 2, ''),
  (STR_TO_DATE('01/10/2020 14:35', '%d/%m/%Y %H:%i'), 8, 8, 7, 3, ''),
  (STR_TO_DATE('01/11/2021 15:35', '%d/%m/%Y %H:%i'), 9, 9, 7, 3, ''),
  (STR_TO_DATE('31/12/2022 16:35', '%d/%m/%Y %H:%i'), 10, 10, 7, 1, '');


  -- Inclua menos três quartos:
  -- Considerando que “a princípio o hospital trabalha com apartamentos, quartos duplos e enfermaria”, 
  -- inclua ao menos esses três tipos com valores diferentes.
  INSERT INTO Quarto (TIPO_QUARTO, VALOR_DIARIA, DESCRICAO) VALUES
  ('A', 99.99, 'ENFERMARIA'),
  ('B', 149.99, 'APARTAMENTO'),
  ('C', 199.99, 'QUARTO DUPLO');


  -- Inclua dados de seis profissionais de enfermaria. Associe cada internação a ao menos dois enfermeiros.
  INSERT INTO enfermeiro ( NOME , CPF, COREN) VALUES
  ('TOMY', '9996663300', 'SP/99966633' ), 
  ('JASON', '88855555522', 'MA/888555555' ), 
  ('KIMBERLY', '77744411100', 'RJ/777444111' ), 
  ('AISHA', '11144477700', 'SP/111444777'), 
  ('ZACK', '22255588800', 'SP/222555888' ), 
  ('BILY', '33366699900' , 'ES/333666999'), 
  ('ADAM', '75395125800', 'PA/753951258A' );


  -- Inclua ao menos sete internações. 
  -- Pelo menos dois pacientes devem ter se internado mais de uma vez.
  -- As internações devem ter ocorrido entre 01/01/2017 e 31/12/2022:
  -- Inclua dados de seis profissionais de enfermaria. Associe cada internação a ao menos dois enfermeiros.
  INSERT INTO
  Internacao (DATA_ENTRADA, PREVISAO_ALTA, ALTA_EFETIVA , PROCEDIMENTOS, ID_QUARTO, ID_PACIENTE, ID_ENFERMEIRO, ID_CONVENIO) 
  VALUES
  (
      STR_TO_DATE('01/01/2017 16:35', '%d/%m/%Y %H:%i'), 
      STR_TO_DATE('31/01/2017 16:35', '%d/%m/%Y %H:%i'), 
      STR_TO_DATE('31/01/2017 16:35', '%d/%m/%Y %H:%i'), 
      'COMPRESSA DE ÁGUA MORNA DIÁRIA',
       1, 1, 7, 1
  ),

  (
      STR_TO_DATE('02/12/2018 16:35', '%d/%m/%Y %H:%i'), 
      STR_TO_DATE('12/12/2018 6:35', '%d/%m/%Y %H:%i'), 
      STR_TO_DATE('22/12/2018 16:35', '%d/%m/%Y %H:%i'), 
      'NEBULIZAÇÃO COM AEROLIM', 
       2, 2, 7, 2
  ),

  (
      STR_TO_DATE('03/12/2019 16:35', '%d/%m/%Y %H:%i'), 
      STR_TO_DATE('11/12/2019 16:35', '%d/%m/%Y %H:%i'), 
      STR_TO_DATE('12/12/2019 16:35', '%d/%m/%Y %H:%i'), 
      'LAVAGEM NASAL 3X POR DIA', 
       3, 3, 7, 3
  ),

  (
      STR_TO_DATE('05/12/2020 16:35', '%d/%m/%Y %H:%i'), 
      STR_TO_DATE('06/12/2020 16:35', '%d/%m/%Y %H:%i'), 
      STR_TO_DATE('06/12/2020 16:35', '%d/%m/%Y %H:%i'), 
      'REPOUSO DE 8 HORAS DIÁRIAS INITERRUPTAS', 
       3, 4, 6, 3
  ),

  (
      STR_TO_DATE('01/12/2018 16:35', '%d/%m/%Y %H:%i'), 
      STR_TO_DATE('04/12/2018 16:35', '%d/%m/%Y %H:%i'), 
      STR_TO_DATE('05/12/2018 16:35', '%d/%m/%Y %H:%i'), 
      'COMPRESSA DE ÁGUA MORNA DIÁRIA', 
       1, 5, 5, 4
  ),

  (
      STR_TO_DATE('11/12/2020 16:35', '%d/%m/%Y %H:%i'), 
      STR_TO_DATE('14/12/2020 16:35', '%d/%m/%Y %H:%i'), 
      STR_TO_DATE('14/12/2020 16:35', '%d/%m/%Y %H:%i'), 
      'BANHO COM PERMANGANATO DE POTÁSSIO 2 X POR DIA', 
       2, 4, 4, 4
  ),

  (
      STR_TO_DATE('21/12/2022 16:35', '%d/%m/%Y %H:%i'), 
      STR_TO_DATE('22/12/2022 16:35', '%d/%m/%Y %H:%i'), 
      STR_TO_DATE('25/12/2022 16:35', '%d/%m/%Y %H:%i'), 
      'COMPRESSA DE ÁGUA MORNA DIÁRIA', 
       2, 4, 3, 2
  );



  -- ===============================================================================================================================
  -- ATV_03_UC_03 PARTE_2

  -- Crie uma coluna “em atividade” com o tipo “bit” na tabela médicos, onde o “0” (zero) representa o “não” e o “1” representa o sim. 
  -- Crie o comando SQL para atualizar ao menos dois smédicos com “não” e o restante com “sim”:
  ALTER TABLE Medico ADD EM_ATIVIDADE bit AFTER ENDERECO;
  UPDATE Medico SET EM_ATIVIDADE = 0 WHERE ID_MEDICO = 1 OR ID_MEDICO = 2;
  UPDATE Medico SET EM_ATIVIDADE = 1 WHERE ID_MEDICO BETWEEN 3 AND 10;


  -- Crie um comando SQL para atualizar as datas de alta nas internações em quartos de enfermaria para três dias após a entrada:
  UPDATE Internacao SET ALTA_EFETIVA = DATE_ADD(DATA_ENTRADA,INTERVAL 3 DAY) WHERE ID_QUARTO = 1; 

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



  -- ===============================================================================================================================
  -- ATIVIDADE 01 - UC 03
  -- EXIBIÇÃO DE TODOS OS DADOS DE CONSULTAS REGISTRADAS EM 2020 SEM CONVÊNIO:

  SELECT
      CST.DATA_HORA AS DATA_CONSULTA,
      MDC.NOME AS NOME_MEDICO, 
      PAC.NOME AS NOME_PACIENTE,
      ESP.VALOR_ESPECIALIDADE AS VALOR_CST, 
      ESPECIALIDADE AS ESPECIALIDADE

  FROM 
      db_hospital_iulano.consulta AS CST, 
      db_hospital_iulano.especialidade AS ESP,
      db_hospital_iulano.paciente AS PAC,
      db_hospital_iulano.medico AS MDC

  WHERE 
      CST.ID_ESPECIALIDADE = ESP.ID_ESPECIALIDADE AND
      CST.ID_PACIENTE = PAC.ID_PACIENTE AND
      CST.ID_MEDICO = MDC.ID_MEDICO AND
      YEAR(DATA_HORA) = 2020 AND
      CST.ID_CONVENIO IS NULL;

  -- ===============================================================================================================================
  -- VALOR MÉDIO DE TODAS AS CONSULTAS REGISTRADAS EM 2020 SEM CONVÊNIO:

  SELECT 
      ROUND(AVG(ESP.VALOR_ESPECIALIDADE), 2) AS VALOR_CST

  FROM 
      db_hospital_iulano.consulta AS CST, 
      db_hospital_iulano.especialidade AS ESP

  WHERE 
      CST.ID_ESPECIALIDADE = ESP.ID_ESPECIALIDADE AND
      YEAR(DATA_HORA) = 2020 AND 
      CST.ID_CONVENIO IS NULL;


  -- ===============================================================================================================================
  -- DE FORMA ANÁLOGA (DADOS COM CONVÊNIO) OBTEMOS COM AS QUERYS ANTERIORES, APENAS ALTERANDO "IS NULL" PARA "IS NOT NULL"
  -- ===============================================================================================================================



  -- Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta:

  SELECT * FROM db_hospital_iulano.internacao
  WHERE ALTA_EFETIVA > PREVISAO_ALTA;


  -- ===============================================================================================================================
  -- Receituário completo da primeira consulta registrada com receituário associado:

  SELECT * FROM db_hospital_iulano.consulta
  WHERE OBS_MEDICO != ''
  ORDER BY ID_CONSULTA ASC
  LIMIT 1;


  -- ===============================================================================================================================
  -- Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas NÃO foram realizadas sob convênio):
  -- MAX VALUE:

    SELECT
      CST.DATA_HORA AS DATA_CONSULTA,
        MDC.NOME AS NOME_MEDICO, 
        PAC.NOME AS NOME_PACIENTE,
        MAX(ESP.VALOR_ESPECIALIDADE) AS MAIOR_VALOR,
        ESPECIALIDADE AS ESPECIALIDADE
    FROM 
        db_hospital_iulano.consulta AS CST, 
        db_hospital_iulano.especialidade AS ESP,
        db_hospital_iulano.paciente AS PAC,
        db_hospital_iulano.medico AS MDC

    WHERE 
        CST.ID_ESPECIALIDADE = ESP.ID_ESPECIALIDADE AND
        CST.ID_PACIENTE = PAC.ID_PACIENTE AND
        CST.ID_MEDICO = MDC.ID_MEDICO AND
        CST.ID_CONVENIO IS NULL;


  -- MIN VALUE:

    SELECT
      CST.DATA_HORA AS DATA_CONSULTA,
        MDC.NOME AS NOME_MEDICO, 
        PAC.NOME AS NOME_PACIENTE,
        MIN(ESP.VALOR_ESPECIALIDADE) AS MENOR_VALOR,
        ESPECIALIDADE AS ESPECIALIDADE
    FROM 
        db_hospital_iulano.consulta AS CST, 
        db_hospital_iulano.especialidade AS ESP,
        db_hospital_iulano.paciente AS PAC,
        db_hospital_iulano.medico AS MDC

    WHERE 
        CST.ID_ESPECIALIDADE = ESP.ID_ESPECIALIDADE AND
        CST.ID_PACIENTE = PAC.ID_PACIENTE AND
        CST.ID_MEDICO = MDC.ID_MEDICO AND
        CST.ID_CONVENIO IS NULL;


  -- ===============================================================================================================================
  -- Todos os dados das internações em seus respectivos quartos, calculando:
  -- Total da internação a partir do valor de diária do quarto.
  -- Número de dias entre a entrada e a alta.

    SELECT
    ITN.ID_INTERNACAO as ID_INTERN, 
      QRT.DESCRICAO AS TP_QUARTO, 
      ITN.DATA_ENTRADA AS DT_ENTRADA,
      DATEDIFF(ITN.ALTA_EFETIVA,  ITN.DATA_ENTRADA) AS DIAS_QUARTO,
      ROUND((DATEDIFF(ITN.ALTA_EFETIVA,  ITN.DATA_ENTRADA) * QRT.VALOR_DIARIA), 2) AS TOTAL_INTERNACAO
    FROM 
        db_hospital_iulano.internacao AS ITN
    INNER JOIN
    db_hospital_iulano.quarto AS QRT ON ITN.ID_QUARTO = QRT.ID_QUARTO ;


  -- ===============================================================================================================================
  -- Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”
  -- EXIBIÇÃO DE DADOS RELEVANTES DO TIPO APARTAMENTO:

    USE DB_HOSPITAL_IULANO;
    SELECT INTERN.DATA_ENTRADA, INTERN.PROCEDIMENTOS, QRT.DESCRICAO AS TIPO_QUARTO
    FROM INTERNACAO AS INTERN JOIN QUARTO AS QRT 
    ON INTERN.ID_QUARTO = QRT.ID_QUARTO
    WHERE QRT.ID_QUARTO = 2;

  -- CONTAGEM DE QUARTOS DO TIPO "APARTAMENTO":
    USE DB_HOSPITAL_IULANO;
    SELECT COUNT(QRT.DESCRICAO) AS TIPO_QUARTO
    FROM INTERNACAO AS INTERN JOIN QUARTO AS QRT 
    ON INTERN.ID_QUARTO = QRT.ID_QUARTO
    WHERE QRT.ID_QUARTO = 2;


  -- ===============================================================================================================================
  -- Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram:
  -- Menores de 18 anos na data da consulta;
  -- Especialidade não seja “pediatria”;
  -- Ordenando por data de realização da consulta:

    USE DB_HOSPITAL_IULANO;
    SELECT
      PACT.NOME AS NOME_PACIENTE,
      CST.DATA_HORA AS DATA_CONSULTA,
      ESP.ESPECIALIDADE AS ESPECIALIDADE
    FROM
      CONSULTA AS CST, PACIENTE AS PACT, ESPECIALIDADE AS ESP
    WHERE
      PACT.NASC > DATE_SUB(PACT.NASC, INTERVAL 18 YEAR) AND
      ESP.ID_ESPECIALIDADE <> 2
    ORDER BY
      CST.DATA_HORA;


  -- ===============================================================================================================================
  -- Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por:
  -- médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
    USE DB_HOSPITAL_IULANO;
    SELECT
      INTERN.ID_INTERNACAO AS ID_INTERN,
      PACT.NOME AS NOME_PACIENTE,
      MDC.NOME AS NOME_MEDICO,
      INTERN.DATA_ENTRADA AS DATA_INTERNACAO,
      INTERN.PROCEDIMENTOS AS PROCEDIMENTOS
    FROM
      MEDICO AS MDC, CONSULTA AS CST, INTERNACAO AS INTERN, PACIENTE AS PACT
    WHERE
      CST.ID_PACIENTE = PACT.ID_PACIENTE AND
      CST.ID_MEDICO = MDC.ID_MEDICO AND
        CST.ID_ESPECIALIDADE = 3
    GROUP BY
      ID_INTERN
    ORDER BY
      CST.DATA_HORA;


  -- ===============================================================================================================================
  -- Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.
    USE DB_HOSPITAL_IULANO;
    SELECT
      MDC.NOME AS NOME_MEDICO,
      MDC.CRM,
      COUNT(CST.ID_MEDICO) AS QTDE_CONSULTAS
    FROM MEDICO AS MDC JOIN CONSULTA AS CST 
    ON MDC.ID_MEDICO = CST.ID_MEDICO
    GROUP BY
      MDC.ID_MEDICO, 
      MDC.NOME, 
      MDC.CRM;


  -- ===============================================================================================================================
  -- Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação:
    USE DB_HOSPITAL_IULANO;
    SELECT
      ENF.ID_ENFERMEIRO, 
      ENF.NOME AS ENFERMEIRO, 
      ENF.COREN AS CRE,
      COUNT(INTERN.ID_INTERNACAO) AS QTDE_INTERNACOES

    FROM 
      ENFERMEIRO AS ENF JOIN INTERNACAO AS intern

    ON
      ENF.ID_ENFERMEIRO = INTERN.ID_ENFERMEIRO

    GROUP BY
      ENF.ID_ENFERMEIRO, 
      ENF.NOME, ENF.COREN;

-- ===============================================================================================================================
-- Inclua ainda uma consulta extra idealizada por você. 
-- No script, em bloco de comentário, escreva o que a consulta deve trazer como resultado e,em seguida, escreva em SQL essa consulta. 
-- É necessário que essa consulta envolva múltiplas tabelas.

-- EXIBIÇÃO DE DADOS RELEVENTAES DE CONSULTAS REALIZADAS EM 2017, CRUZANDO DADOS DAS TABELAS: 
-- CONSULTA, ESPECIALIDADE, PACIENTE E MEDICO: 

  SELECT
      CST.DATA_HORA AS DATA_CONSULTA,
      MDC.NOME AS NOME_MEDICO, 
      PAC.NOME AS NOME_PACIENTE,
      ESP.VALOR_ESPECIALIDADE AS VALOR_CST, 
      ESPECIALIDADE AS ESPECIALIDADE

  FROM 
      db_hospital_iulano.consulta AS CST, 
      db_hospital_iulano.especialidade AS ESP,
      db_hospital_iulano.paciente AS PAC,
      db_hospital_iulano.medico AS MDC

  WHERE 
      CST.ID_ESPECIALIDADE = ESP.ID_ESPECIALIDADE AND
      CST.ID_PACIENTE = PAC.ID_PACIENTE AND
      CST.ID_MEDICO = MDC.ID_MEDICO AND
      YEAR(DATA_HORA) = 2017;

-- ===============================================================================================================================