# Query com todas as transformações
SELECT 
	CASE 
		WHEN classe = 'no-recurrence-events' THEN 0 
        WHEN classe = 'recurrence-events' THEN 1
	END as classe,
	idade,
	menopausa,
	CASE 
		WHEN tamanho_tumor = '0-4' OR tamanho_tumor = '5-9' THEN 'Muito Pequeno'
        WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN 'Pequeno'
        WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN 'Medio'
        WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN 'Grande'
        WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN 'Muito Grande'
        WHEN tamanho_tumor = '50-54' OR tamanho_tumor = '55-59' THEN 'Tratamento Urgente'
	END as tamanho_tumor,
	inv_nodes,
	CASE 
		WHEN node_caps = 'no' THEN 0 
        WHEN node_caps = 'yes' THEN 1
        ELSE 2
	END as node_caps,
	deg_malig,
	CASE 
		WHEN seio = 'left' THEN 'E' 
        WHEN seio = 'right' THEN 'D'
	END as seio,
	CASE 
		WHEN quadrante = 'left_low' THEN 1 
        WHEN quadrante = 'right_up' THEN 2 
        WHEN quadrante = 'left_up' THEN 3
        WHEN quadrante = 'right_low' THEN 4
        WHEN quadrante = 'central' THEN 5
        ELSE 0
	END as quadrante,
	CASE 
		WHEN irradiando = 'no' THEN 0 
        WHEN irradiando = 'yes' THEN 1
	END as irradiando
FROM bd_cancer_de_mama.tb_dados_cmm;

# Cria uma nova tabela
CREATE TABLE bd_cancer_de_mama.tb_etl_cmm
AS
SELECT 
	CASE 
		WHEN classe = 'no-recurrence-events' THEN 0 
        WHEN classe = 'recurrence-events' THEN 1
	END as classe,
	idade,
	menopausa,
	CASE 
		WHEN tamanho_tumor = '0-4' OR tamanho_tumor = '5-9' THEN 'Muito Pequeno'
        WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN 'Pequeno'
        WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN 'Medio'
        WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN 'Grande'
        WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN 'Muito Grande'
        WHEN tamanho_tumor = '50-54' OR tamanho_tumor = '55-59' THEN 'Tratamento Urgente'
	END as tamanho_tumor,
	inv_nodes,
	CASE 
		WHEN node_caps = 'no' THEN 0 
        WHEN node_caps = 'yes' THEN 1
        ELSE 2
	END as node_caps,
	deg_malig,
	CASE 
		WHEN seio = 'left' THEN 'E' 
        WHEN seio = 'right' THEN 'D'
	END as seio,
	CASE 
		WHEN quadrante = 'left_low' THEN 1 
        WHEN quadrante = 'right_up' THEN 2 
        WHEN quadrante = 'left_up' THEN 3
        WHEN quadrante = 'right_low' THEN 4
        WHEN quadrante = 'central' THEN 5
        ELSE 0
	END as quadrante,
	CASE 
		WHEN irradiando = 'no' THEN 0 
        WHEN irradiando = 'yes' THEN 1
	END as irradiando
FROM bd_cancer_de_mama.tb_dados_cmm;


#Checar volume de registros após alterações:
# SELECT COUNT(*) FROM bd_cancer_de_mama.tb_etl_cmm;

-- DESAFIO:

-- 1-Aplique label encoding à variável menopausa.
-- 2-[Desafio] Crie uma nova coluna chamada posicao_tumorconcatenando as colunas inv_nodese quadrante.
-- 3-[Desafio] Aplique One-Hot-Encoding à coluna deg_malig.
-- 4-Crie um novo datasetcom todas as variáveis após as transformações anteriores.