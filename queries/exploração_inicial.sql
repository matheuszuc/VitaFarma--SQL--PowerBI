-- 1. Quantidade de produtos por categoria
SELECT nome_categoria, COUNT(nome_produto) AS Produtos
FROM categorias
JOIN produtos ON categorias.categoria_id = produtos.categoria_id
GROUP BY nome_categoria;

-- 2. Lojas da região Sudeste
SELECT *
FROM lojas
WHERE regiao = "Sudeste";

-- 3. Clientes com plano fidelidade
SELECT *
FROM clientes
WHERE plano_fidelidade = "S";
