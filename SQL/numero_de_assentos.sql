SELECT case WHEN assento % 2= 0 THEN 'par' ELSE 'impar'  END as assentos, COUNT(idticket) as numero_de_assentos from 
(SELECT IIF(cidadeorigem < cidadedestino,
    cidadeorigem ||' - ' ||cidadedestino, 
    cidadedestino ||' - ' ||cidadeorigem) as Rota, * from tickets
JOIN (SELECT * from vendas
      JOIN clientes on vendas.idCliente=clientes.idcliente) as compras
on compras.idvenda=tickets.idvenda
 WHERE Rota in (SELECT
IIF(cidadeorigem < cidadedestino,
    cidadeorigem ||' - ' ||cidadedestino, 
    cidadedestino ||' - ' ||cidadeorigem) as Rota
FROM 
tickets
JOIN (SELECT * from vendas
      JOIN clientes on vendas.idCliente=clientes.idcliente) as compras
on compras.idvenda=tickets.idvenda
WHERE statusvenda='confirmada' and estadocliente='Minas Gerais'
GROUP BY  IIF(cidadeorigem < cidadedestino,
    cidadeorigem ||' - ' ||cidadedestino, 
    cidadedestino ||' - ' ||cidadeorigem)  
ORDER BY COUNT(*) DESC
LIMIT 5) and statusvenda='confirmada' and estadocliente='Minas Gerais') as tabela_final
GROUP by assentos;