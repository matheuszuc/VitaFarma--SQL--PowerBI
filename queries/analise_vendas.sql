-- 3. Faturamento Total por Loja
SELECT nome_loja, SUM(quantidade * preco_unit) AS Valor_Total
FROM vendas
JOIN lojas ON lojas.loja_id = vendas.loja_id
JOIN itens_venda ON vendas.venda_id
GROUP BY nome_loja
ORDER BY Valor_Total DESC
-- 4. Produtos que venderam mais de 10 unidades
SELECT nome_produto, SUM(quantidade) AS Quantidade
FROM itens_venda
JOIN produtos ON produtos.produto_id = itens_venda.produto_id
GROUP BY nome_produto
HAVING SUM(quantidade) > 9
Order by Quantidade DESC

