-- JOIN ou INNER JOIN - busca de campos iguais em tabelas diferentes com retorno apenas dos campos que se relacionam --
SELECT tabela_1.campos, tabela_2.campos 
FROM tabela_1 
JOIN tabela_2 
	ON tabela_2.campos = tabela_1.campos; -- Comando ON é uma condição referente ao JOIN --

-- LEFT JOIN ou  LEFT OUTER JOIN - busca de campos iguais em tabelas diferentes com retorno da tabela a esquerda inteira e dos campos que se relacionam da tabela a direita --
SELECT tabela_1.campos, tabela_2.campos
FROM tabela_1
LEFT JOIN tabela_2
	ON tabela_2.campo = tabela_1.campo; -- O critério de esquerda ou direita é dado na sequencia de escrita do comando --

-- RIGHT JOIN ou RIGHT OUTER JOIN - busca de campos iguais em tabelas diferentes com retorno da tabela a direita inteira e dos campos que se relacionam da tabela a esquerda--
SELECT tabela_1.campos, tabela_2.campos
FROM tabela_1
RIGHT JOIN tabela_2
	ON tabela_2.campo = tabela_1.campo;

-- FULL JOIN ou FULL OUTER JOIN - busca de campos iguais em tabelas diferentes que retorna todas as relaçôes possiveis --
SELECT tabela_1.campos, tabela_2.campos
FROM tabela_1
FULL JOIN tabela_2
	ON tabela_2.campo = tabela_1.campo;

--CROSS JOIN - todos os dados de uma tabela serão cruzados com todos os dados da outra tabela criando uma matriz --
SELECT tabela_1.campos, tabela_2.campos
FROM tabela_1
CROSS JOIN tabela_2;
------------------------------------------------------------------------------------------------------------------

SELECT COUNT(1) FROM banco; -- 151 bancos
SELECT COUNT(1) FROM agencia; -- 296 agencias

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT COUNT(DISTINCT banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
LEFT JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT agencia.numero, agencia.nome, banco.numero, banco.nome
FROM agencia
RIGHT JOIN banco ON banco.numero = agencia.banco_numero;

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
FULL JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
CROSS JOIN agencia;

SELECT banco.nome,
	   agencia.nome,
	   conta_corrente.numero,
	   conta_corrente.digito,
	   cliente.nome
FROM banco
JOIN agencia 
	ON agencia.banco_numero = banco.numero
JOIN conta_corrente	
	-- ON conta_corrente.banco_numero = agencia.banco_numero
	ON conta_corrente.banco_numero = banco.numero 
	AND conta_corrente.agencia_numero = agencia.numero
JOIN cliente 
	ON cliente.numero = conta_corrente.cliente_numero;
	
SELECT banco.nome,
	   agencia.nome,
	   conta_corrente.numero,
	   conta_corrente.digito,
	   cliente.nome,
	   tipo_transacao.nome,
	   cliente_transacoes.valor
FROM banco
JOIN agencia 
	ON agencia.banco_numero = banco.numero
JOIN conta_corrente	
	--ON conta_corrente.banco_numero = agencia.banco_numero
	ON conta_corrente.banco_numero = banco.numero 
	AND conta_corrente.agencia_numero = agencia.numero
JOIN cliente 
	ON cliente.numero = conta_corrente.cliente_numero
JOIN cliente_transacoes
	ON cliente_transacoes.valor > 0
JOIN tipo_transacao
	ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id;


