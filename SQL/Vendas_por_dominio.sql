SELECT 
	SUBSTRING (emailcliente, INSTR(emailcliente, '@'), 4) as Dominios_de_email, 
	ROUND(sum(totalvenda)) as Total_de_vendas
FROM 
	clientes
JOIN vendas ON clientes.idcliente = vendas.idcliente
WHERE statusvenda='confirmada'
GROUP by SUBSTRING (emailcliente, INSTR(emailcliente, '@')+1, 4)
ORDER by total_de_vendas DESC
LIMIT 3;