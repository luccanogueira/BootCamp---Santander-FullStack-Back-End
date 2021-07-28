SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;
SELECT numero, nome, email FROM cliente;
SELECT id, nome FROM tipo_transacao;
SELECT banco_numero, agencia_numero, cliente_numero FROM cliente_transacoes;

-- AVG - média de valores 
SELECT AVG(valor) FROM cliente_transacoes;

-- COUNT (having) - contagem de dados
SELECT COUNT (numero) FROM cliente;
SELECT COUNT (numero), email FROM cliente WHERE email ILIKE '%gmail.com' GROUP BY email;
SELECT COUNT (id), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id HAVING COUNT(id) >150; 

-- MAX - trás o maior numero
SELECT MAX (valor) FROM cliente_transacoes;
SELECT MAX (valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id;

-- MIN - trás o menor numero
SELECT MIN (valor) FROM cliente_transacoes;
SELECT MIN (valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id;

-- SUM - soma de todos os regitros
SELECT SUM (valor) FROM cliente_transacoes;
SELECT SUM (valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id ORDER BY tipo_transacao_id ASC;
SELECT SUM (valor), tipo_transacao_id FROM cliente_transacoes GROUP BY tipo_transacao_id ORDER BY tipo_transacao_id DESC;
