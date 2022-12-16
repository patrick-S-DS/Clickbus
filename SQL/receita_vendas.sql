SELECT 
	ROUND(sum(totalvenda),2) as Receita_vendas 
	,plataforma
from 
	tickets
JOIN (SELECT 
			* 
		from 
			vendas
      JOIN clientes on vendas.idcliente = clientes.idcliente) as rotas
      on tickets.idvenda = rotas.idvenda
WHERE statusvenda='confirmada' and estadocliente not in ('Parana', 'Santa Catarina', 'Rio Grande do Sul', 'Goias', 'Mato Grosso', 'Distrito Federal')
GROUP by plataforma;