SELECT
IIF(cidadeorigem < cidadedestino,
    cidadeorigem ||' - ' ||cidadedestino, 
    cidadedestino ||' - ' ||cidadeorigem) as rotas,
COUNT(*) 
FROM tickets
JOIN (SELECT * from vendas
      JOIN clientes on vendas.idCliente=clientes.idcliente) as compras
on compras.idvenda=tickets.idvenda
WHERE statusvenda='confirmada' and estadocliente='Minas Gerais'
GROUP BY  IIF(cidadeorigem < cidadedestino,
    cidadeorigem ||' - ' ||cidadedestino, 
    cidadedestino ||' - ' ||cidadeorigem) 
ORDER BY COUNT(*) DESC
LIMIT 5;