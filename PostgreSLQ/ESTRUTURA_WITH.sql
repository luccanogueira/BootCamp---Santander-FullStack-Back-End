-- WITH statements - é uma forma de organizar blocos de códigos, que podem ser SELECTs, INSERTs, UPDATEs ou DELETEs

SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;

WITH tbl_temp_banco AS (
	SELECT numero, nome
	FROM banco
)
SELECT numero, nome FROM tbl_temp_banco;

WITH parametros AS (
	SELECT 213 AS banco_numero
), tbl_temp_banco AS (
	SELECT numero, nome
	FROM banco
	JOIN parametros ON parametros.banco_numero = banco.numero
)
SELECT numero, nome FROM tbl_temp_banco;

WITH cliente_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
		   tipo_transacao.nome AS tipo_transacao_nome,
		   cliente_transacoes.valor AS tipo_transacao_valor
	FROM cliente_transacoes
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
)
SELECT cliente_nome, tipo_transacao_nome, tipo_transacao_valor
FROM cliente_e_transacoes;

WITH cliente_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
		   tipo_transacao.nome AS tipo_transacao_nome,
		   cliente_transacoes.valor AS tipo_transacao_valor
	FROM cliente_transacoes
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
	JOIN banco ON banco.numero = cliente_transacoes.banco_numero AND banco.nome ILIKE '%itaú%'
)
SELECT cliente_nome, tipo_transacao_nome, tipo_transacao_valor
FROM cliente_e_transacoes;