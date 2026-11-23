-- Recuperações simples com SELECT Statement
-- Filtros com WHERE Statement
select count(*) from clientes;

select * from clientes c, pedido p where c.idCliente = p.Cliente_idCliente;


select Pnome, Sobrenome, idPedido, Pedido_Status 
from clientes c, pedido p 
where c.idCliente = Cliente_idCliente
order by Pnome;
						

-- Crie expressões para gerar atributos derivados
select concat(Pnome,' ', Nome_do_meio, ' ', Sobrenome) as Cliente, idPedido, Pedido_Status as Status 
from clientes c, pedido p
where c.idCliente = p.Cliente_idCliente;

select count(*) from clientes c, pedido p
			where c.idCliente = Cliente_idCliente;

-- recuperação das informações dos nomes dos cliente e tipo de pagamentos
select c.idCliente, concat(Pnome,' ', Nome_do_meio, ' ', Sobrenome) as Cliente, idpagamento, tipo_Pagamento,
limiteDisponivel from clientes c, pagamentos p
where c.idCliente = p.idCliente;

-- Defina ordenações dos dados com ORDER BY
-- recuperação  de pedido com produto associado
select * from clientes c 
		   inner join pedido p ON c.idCliente = p.Cliente_idCliente
		   inner join produto_pedido d  on d.idPp_pedido = p.idPedido
		   order by idCliente; 


-- Condições de filtros aos grupos – HAVING Statement
-- Obtenha todos os pedidos, incluindo o nome do cliente e o valor total do pedido
select concat(Pnome,' ', Nome_do_meio, ' ', Sobrenome) as Cliente, idPedido, Pedido_Status as Status, 
Pedido_Valor as Valor_Total 
from clientes c, pedido p
where c.idCliente= p.Cliente_idCliente
group by idPedido
having Pedido_Status <> 'Cancelado';


-- Obtenha informações de envio com endereço e dados do cliente
select * from Entrega e
		   left join pedido p ON e.id_pedido = p.idPedido
		   left join clientes c  on c.idCliente = p.Cliente_idCliente
		   group by id_entrega; 


-- Agregar dados usando GROUP BY
-- Recuperar quantos pedidos foram realizados pelos clientes?
select c.idCliente, concat(Pnome,' ', Nome_do_meio, ' ', Sobrenome) as Cliente, 
count(*) as Numeros_Pedidos from clientes c 
		inner join pedido p ON c.idCliente = p.Cliente_idCliente
		group by idCliente; 


-- Relação de produtos_fornecedores e estoques
SELECT
    e.idProdEstoque,
    e.localEstoque,
    e.quantidade,
    f.idPproduto,
    f.prod_quantidade,
    p.Pnome,
    p.Valor
FROM estoque e
INNER JOIN estoque_local l
    ON l.idLestoque = e.idProdEstoque
INNER JOIN produto_fornecedor f
    ON f.idPproduto = l.idLproduto
INNER JOIN produtos p 
     ON p.idProduto = f.idPproduto
     order by idPproduto;
    

-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT f.idFornecedor, f.NomeSocial,  p.Pnome, r.idPproduto FROM fornecedor f 
INNER JOIN  produto_fornecedor r 
     ON r.idPFornecedor = f.idFornecedor
INNER JOIN produtos p 
     ON r.idPproduto = p.idProduto
     order by idFornecedor;
     
     
-- Relação de nomes dos vendedores (terceiro) e nomes dos produtos
SELECT t.idVendedor, t.NomeSocial,  p.Pnome, v.idPproduto FROM terceiro_vendedor t 
INNER JOIN  produtos_vendedor_terc v 
     ON v.idPVendedor = t.idVendedor
INNER JOIN produtos p 
     ON v.idPproduto = p.idProduto
     order by idVendedor;



