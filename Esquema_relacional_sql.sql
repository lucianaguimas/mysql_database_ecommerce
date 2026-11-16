use e_commerce;

insert into clientes (Pnome, Nome_do_meio, Sobrenome, CPF, Endereço) 
	   values('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
		     ('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores'),
			 ('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
			 ('Julia','S','França', 789123456,'rua lareijras 861, Centro - Cidade das flores'),
			 ('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
			 ('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores');
       

insert into produtos (Pnome, Categoria, Avaliação, Valor) values
							  ('Fone de ouvido','Eletrônico','4',null),
                              ('Barbie Elsa','Brinquedos','3',null),
                              ('Body Carters','Vestimenta','5',null),
                              ('Microfone Vedo - Youtuber','Eletrônico','4',null),
                              ('Sofá retrátil','Móveis','3','3x57x80'),
                              ('Farinha de arroz','Alimentos','2',null),
                              ('Fire Stick Amazon','Eletrônico','3',null);
               
INSERT INTO pagamentos (idCliente, tipo_Pagamento, limiteDisponivel)
VALUES
(1,  'Cartão', 2500.00),
(2, 'Boleto', 0.00),
(4, 'Dois cartões', 4500.00)
;           
               

insert into pedido ( Cliente_idCliente, Pedido_Status, Descricao, Pedido_Valor, pagamento_Cash, idpagamento) values 
							 (1, default,'compra via aplicativo',null,1, 1),
                             (2,default,'compra via aplicativo',50,0,2 ),
                             (3,'Confirmado',null,null,1,null),
                             (4,default,'compra via web site',150,0, 3);

insert into produto_pedido (idPp_produto, idPp_pedido, Pp_Quantidade, Pp_Status) values
						 (1,9,2,null),
                         (2,10,1,null),
                         (3,12,1,null);
                         
 insert into estoque (localEstoque,quantidade) values 
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);     

insert into estoque_local (idLproduto, idLestoque, localização) values
						 (1,2,'RJ'),
                         (2,6,'GO');

insert into cadastro_vendedor (nome_comercial, email, telefone, tipo_vendedor, documento_número) values
	('Almeida e Filhos', 'contato@almeidafilhos.com.br', '21985474001', 'CNPJ', '12345678912345'),
    ('Eletrônicos Silva', 'vendas@eletronicossilva.com.br', '21985484002', 'CNPJ', '85451964914345'),
    ('Eletrônicos Valma', 'comercial@valma.com.br', '21975474003', 'CNPJ', '93456789393469'),
    ('Tech Electronics', 'suporte@techelectronics.com.br', '21994628704', 'CNPJ', '12345678945632'),
    ('Boutique Durgas', 'atendimento@boutiquedurgas.com.br', '21956789505', 'CPF', '123456783'),
    ('Kids World', 'contato@kidsworld.com.br', '11986574846', 'CNPJ', '45678912365448'),
	('Ateliê Criativo Durgas', 'ateliecriativodurgas@gmail.com','219567895' , 'CPF', '12345678300'),
	('Universo Infantil', 'universoinfantil@gmail.com','1198657484' , 'CPF', '45678912365');
    
insert into fornecedor (NomeSocial, CNPJ, Contato) values 
							('Almeida e filhos', 12345678912345,'21985474'),
                            ('Eletrônicos Silva',85451964914345,'21985484'),
                            ('Eletrônicos Valma', 93456789393469,'21975474'),
                            ('Kids World', '45678912365448','11986574846');

insert into produto_fornecedor (idPfornecedor, idPproduto, prod_quantidade) values
						 (1,3,50),
                         (1,5,100),
                         (2,4,500),
                         (3,1,300),
                         (2,2,150);
						
insert into terceiro_vendedor (NomeSocial, Nome_fantasia, CPF, localização, contato) values 
					    ('Botique Durgas',null,123456783,'Rio de Janeiro', 219567895),
                        ('Ateliê Criativo Durgas', NULL, '12345678300', 'Rio de Janeiro', '219567895'),
						('Universo Infantil', NULL, '45678912365', 'São Paulo', '1198657484');
                        
insert into produtos_vendedor_terc (idPvendedor, idPproduto, prodQuantidade) values 
						 (1,6,80),
                         (3,2,30);
                       
insert into entrega (id_pedido, status_entrega, codigo_rastreio, data_envio, data_entrega) values
	(9, 'Em trânsito', 'BR123456789RJ', '2026-11-10', NULL),
    (10, 'Entregue', 'BR987654321SP', '2026-11-05', '2026-11-08'),
    (12, 'Aguardando postagem', 'BR456789123MG', NULL, NULL);                   
                        