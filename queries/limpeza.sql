-- ================================================
-- LIMPEZA E QUALIDADE DE DADOS - VitaFarma
-- Execute antes de qualquer análise
-- ================================================

-- 0.1 Verificando se o custo está menor que o preço de venda
SELECT preco_venda, custo, nome_produto
FROM produtos
WHERE custo >= preco_venda
ORDER BY custo
-- 0.2 Verificando se todas as vendas tem produto associado
SELECT itens_venda.venda_id
FROM itens_venda
LEFT JOIN vendas ON vendas.venda_id = itens_venda.venda_id
WHERE itens_venda.venda_id IS NULL
-- 0.3 Verificando clientes duplicados
SELECT cpf, COUNT(cpf) AS total
FROM clientes
GROUP BY cpf
HAVING COUNT(cpf) > 1