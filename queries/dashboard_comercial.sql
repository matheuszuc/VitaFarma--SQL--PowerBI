-- 5. Faturamento Mensal
SELECT strftime('%Y-%m', data_venda) AS Data, SUM(quantidade * preco_unit) AS valor_total
FROM vendas
JOIN itens_venda ON vendas.venda_id = itens_venda.venda_id
WHERE strftime('%Y-%m', data_venda) >= '2024-01'
GROUP BY strftime('%Y-%m', data_venda)
ORDER BY Data ASC


-- 6. Ticket Médio por Loja
SELECT nome_loja, ROUND(AVG(valor_venda), 2) AS Ticket_Medio
From ( 
SELECT nome_loja, SUM(quantidade * preco_unit) AS valor_venda 
FROM vendas 
JOIN lojas ON lojas.loja_id = vendas.loja_id 
JOIN itens_venda ON vendas.venda_id = itens_venda.venda_id
GROUP BY vendas.venda_id, nome_loja
)
GROUP BY nome_loja
ORDER BY Ticket_Medio DESC

-- 7. Vendas por Categoria
SELECT nome_categoria, SUM(quantidade * preco_unit) AS valor_total
FROM categorias
JOIN produtos ON categorias.categoria_id = produtos.categoria_id
JOIN itens_venda ON itens_venda.produto_id = produtos.produto_id
GROUP BY nome_categoria 
ORDER BY valor_total DESC