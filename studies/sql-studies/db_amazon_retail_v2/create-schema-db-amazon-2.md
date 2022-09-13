### Criação do Schema db-amazon-retail-v2:


```sql

CREATE SCHEMA `db-amazon-retail-v2` ;

CREATE TABLE `db-amazon-retail-v2`.`TB_CLIENTES` (
  `id_cliente` INT NULL,
  `nome_cliente` VARCHAR(50) NULL,
  `endereco_cliente` VARCHAR(50) NULL,
  `cidade_cliente` VARCHAR(50) NULL,
  `estado_cliente` VARCHAR(50) NULL);

```

```sql
INSERT INTO `db-amazon-retail-v2`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (1, "Bob Silva", "Rua 67", "Fortaleza", "CE");

INSERT INTO `db-amazon-retail-v2`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (2, "Ronaldo Azevedo", "Rua 64", "Campinas", "SP");

INSERT INTO `db-amazon-retail-v2`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (3, "John Lenon", "Rua 42", "Rio de Janeiro", "RJ");

INSERT INTO `db-amazon-retail-v2`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (4, "Billy Joel", "Rua 39", "Campos", "RJ");

INSERT INTO `db-amazon-retail-v2`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (5, "Lady Gaga", "Rua 45", "Porto Alegre", "RS");

INSERT INTO `db-amazon-retail-v2`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (6, "Zico Nunes", "Rua 67", "Fortaleza", "CE");

INSERT INTO `db-amazon-retail-v2`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (7, "Maria Aparecida", "Rua 61", "Natal", "RN");

INSERT INTO `db-amazon-retail-v2`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (8, "Elton John", "Rua 22", "Ubatuba", "SP");

INSERT INTO `db-amazon-retail-v2`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (9, "Dario Maravilha", "Rua 14", "Ubatuba", "SP");

INSERT INTO `db-amazon-retail-v2`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (10, "Lebron James", "Rua 29", "Fortaleza", "CE");


CREATE TABLE `db-amazon-retail-v2`.`TB_PEDIDOS` (
  `id_pedido` INT NULL,
  `id_cliente` INT NULL,
  `id_vendedor` INT NULL,
  `data_pedido` DATETIME NULL,
  `id_entrega` INT NULL,
  `valor_pedido` DECIMAL(10,2) NULL);


INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1001, 1, 5, now(), 23, 100.00);

INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1002, 1, 7, now(), 24, 112.00);

INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1003, 2, 5, now(), 23, 250.00);

INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1004, 3, 5, now(), 23, 340.00);

INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1005, 4, 7, now(), 24, 1290.00);

INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1006, 9, 5, now(), 23, 89.00);

INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1007, 5, 5, now(), 23, 468.50);

INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1008, 1, 7, now(), 24, 572.20);

INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1009, 8, 5, now(), 23, 187.45);

INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1010, 7, 7, now(), 24, 579.20);

INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1011, 10, 5, now(), 23, 192.45);

INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1012, 8, 5, now(), 23, 140.45);

INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1013, 5, 7, now(), 28, 573.20);

INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1014, 6, 5, now(), 27, 191.45);

INSERT INTO `db-amazon-retail-v2`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1015, 6, 4, now(), 22, 154.37);


CREATE TABLE `db-amazon-retail-v2`.`TB_VENDEDOR` (
  `id_vendedor` INT NULL,
  `nome_vendedor` VARCHAR(50) NULL,
  `dept_vendedor` VARCHAR(50) NULL);


INSERT INTO `db-amazon-retail-v2`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`, `dept_vendedor`)
VALUES (1, "Vendedor 1", "Eletronicos");

INSERT INTO `db-amazon-retail-v2`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`, `dept_vendedor`)
VALUES (2, "Vendedor 2", "Vestuario");

INSERT INTO `db-amazon-retail-v2`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`, `dept_vendedor`)
VALUES (3, "Vendedor 3", "Eletronicos");

INSERT INTO `db-amazon-retail-v2`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`, `dept_vendedor`)
VALUES (4, "Vendedor 4", "Moveis");

INSERT INTO `db-amazon-retail-v2`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`, `dept_vendedor`)
VALUES (5, "Vendedor 5", "Eletrodomesticos");

INSERT INTO `db-amazon-retail-v2`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`, `dept_vendedor`)
VALUES (6, "Vendedor 6", "Eletrodomesticos");

INSERT INTO `db-amazon-retail-v2`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`, `dept_vendedor`)
VALUES (7, "Vendedor 7", "Eletronicos");
```

### SUMARIZAÇÃO DE DADOS:

```sql
-- Quantidade de clientes por cidade:

SELECT cidade_cliente, count(cidade_cliente) AS Qtde_Clientes
from tb_clientes
group by cidade_cliente
order by Qtde_Clientes DESC;

-- Média de valor dos pedidos:


SELECT AVG(VALOR_PEDIDO) AS media
FROM TB_PEDIDOS;


-- Média do valor dos pedidos por cidade:

SHOW DATABASES;
USE `db-amazon-retail-v2`;
DESCRIBE tb_clientes;
DESCRIBE tb_pedidos;

SELECT TBC.cidade_cliente AS cidade_clt, ROUND(AVG(TBP.valor_pedido),2) AS media_pdd
FROM tb_pedidos AS TBP INNER JOIN tb_clientes AS TBC ON TBP.id_cliente = TBC.id_cliente
GROUP BY cidade_clt
ORDER BY media_pdd DESC;

-- OU

SELECT TBC.cidade_cliente AS cidade_clt, ROUND(AVG(TBP.valor_pedido),2) AS media_pdd
FROM tb_pedidos AS TBP LEFT JOIN tb_clientes AS TBC 
WHERE TBP.id_cliente = TBC.id_cliente
GROUP BY cidade_clt
ORDER BY media_pdd DESC;
```


```sql
-- Em ambos os exemplos a consulta só retorna clientes com correspondência em pedidos.
-- Dessa forma, para retornar por exemplo clientes que não fizeram pedido também, usamos então o RIGHT JOIN.
-- Além disso, precisamos previamente tratar os valores que vierem nulos com CASE:
-- no MySQL o "WHERE" funciona, no HeidiSQL somente o "ON", vide abaixo:

USE `DB-AMAZON-RETAIL-V2`;

SELECT

  CASE
    WHEN ROUND(AVG(TBP.valor_pedido),2) IS NULL THEN 0  -- Quando valor for nulo retorno 0;
    ELSE ROUND(AVG(TBP.valor_pedido),2) -- Senão, retorno o valor formatado;
    end AS media_pdd,
   TBC.cidade_cliente AS cidade_clt
   
FROM tb_pedidos AS TBP RIGHT JOIN tb_clientes AS TBC 
ON TBP.id_cliente = TBC.id_cliente
GROUP BY cidade_clt
ORDER BY media_pdd DESC;


-- =============================================================================================================

-- Soma total do valor de pedidos por cidade. (Tanto o INNER, quanto o LEFT, quanto o WHERE são a mesma coisa):

SELECT SUM(
  TBP.valor_pedido) AS Total,
  TBC.cidade_cliente AS Cidades,
    TBC.estado_cliente AS Estado
FROM
  tb_pedidos AS TBP LEFT JOIN tb_clientes AS TBC
ON
  TBP.id_cliente = TBC.id_cliente
  GROUP BY Cidades, Estado
  ORDER BY Total DESC;


SELECT SUM(
  TBP.valor_pedido) AS Total,
  TBC.cidade_cliente AS Cidades,
  TBC.estado_cliente AS Estado
FROM
  tb_pedidos AS TBP INNER JOIN tb_clientes AS TBC
ON
  TBP.id_cliente = TBC.id_cliente
  GROUP BY Cidades, Estado
  ORDER BY Total DESC;


  SELECT SUM(
  TBP.valor_pedido) AS Total,
  TBC.cidade_cliente AS Cidades,
  TBC.estado_cliente AS Estado
FROM
  tb_pedidos AS TBP INNER JOIN tb_clientes AS TBC
WHERE
  TBP.id_cliente = TBC.id_cliente
  GROUP BY Cidades, Estado
  ORDER BY Total DESC;

-- =============================================================================================================


INSERT INTO `db-amazon-retail-v2`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (14, "Yullano Santos", "Rua 100", "Campinas", "SP");

INSERT INTO `db-amazon-retail-v2`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (15, "Gabriel Soares", "Rua 200", "São José dos Campos", "SP");

INSERT INTO `db-amazon-retail-v2`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (16, "Davi Soares", "Rua 300", "Guarulhos", "SP");

-- Soma de pedidos com RIGHT JOIN e CASE. Neste cenário localizamos os ítens sem correspondência, no caso, os clientes 14, 15, 16.
-- Eles são inseridos na tb_clientes mas não tem pedidos realizados:

SELECT
  CASE
    WHEN FLOOR(SUM(TBP.valor_pedido)) IS NULL THEN 0
    ELSE FLOOR(SUM(TBP.valor_pedido))
    END AS Total,
    TBC.cidade_cliente AS Cidade,
    TBC.estado_cliente AS Estado
FROM
  tb_pedidos AS TBP RIGHT JOIN tb_clientes AS TBC
ON
  TBC.id_cliente = TBP.id_cliente
  GROUP BY Cidade, Estado 
  ORDER BY Total DESC;

```


```sql
-- Supondo que a comissão de cada vendedor seja de 10%, quanto cada vendedor ganhou de comissão nas vendas do estado do Ceará?
-- Retorno 0 se não houve ganho de comissão.

-- Cenário 01: Retornar apenas resultados de com correspondência (Vendedores com comiisão):

SELECT
--  TBV.nome_vendedor AS Seller,  
--  SUM(TBP.valor_pedido * 0.10) AS Comission,
--  TBC.estado_cliente AS State
  
  TBV.nome_vendedor AS Seller,
  TBC.estado_cliente AS State,
  CASE
    WHEN SUM(TBP.valor_pedido) IS NULL THEN 0
    ELSE SUM(TBP.valor_pedido * 0.1)
  END AS Comission
  
FROM
  tb_pedidos AS TBP,
  tb_clientes AS TBC,
  tb_vendedor AS TBV
WHERE
  TBP.id_cliente = TBC.id_cliente AND
  TBP.id_vendedor = TBV.id_vendedor AND
  TBC.estado_cliente = 'CE'
GROUP BY Seller, State
ORDER BY Comission;
```

```sql
-- Cenário 02: Todos os vendedores do Ceará com e sem comissão:

SELECT
  TBV.nome_vendedor AS Seller,
  
  CASE
    WHEN TBC.estado_cliente IS NULL THEN "Não atua no Ceará"
    ELSE TBC.estado_cliente
  END AS State,
  
  CASE
    WHEN ROUND(SUM(TBP.valor_pedido * 0.10),2) IS NULL THEN 0
    ELSE ROUND(SUM(TBP.valor_pedido * 0.10),2)
  END AS Comission
  
FROM
  tb_pedidos AS TBP INNER JOIN
  tb_clientes AS TBC RIGHT JOIN
  tb_vendedor AS TBV
ON
  TBP.id_cliente = TBC.id_cliente AND
  TBP.id_vendedor = TBV.id_vendedor AND
  TBC.estado_cliente = 'CE'
GROUP BY Seller, State
ORDER BY Comission DESC;


-- Retornar Nome, Cidade, Cliente e número de pedidos 4/5 CP 05:

-- Vendedores que tiveram pedidos com valor superior a R$600,00.

-- 

```

### FILTROS COM HAVING

```sql
-- Retornar apenas vendedores cuja média seja maior que 800;

```

