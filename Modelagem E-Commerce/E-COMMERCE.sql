-- criacao BDD e-commerce 

 -- DROP DATABASE ecommerce; 
-- show tables;
CREATE DATABASE ecommerce; 
USE ecommerce; 
-- tabela cliente
CREATE TABLE client (
	id_client INT AUTO_INCREMENT PRIMARY KEY,
    f_name VARCHAR(30),
    m_name CHAR(3),
    l_name VARCHAR(20), 
    CPF CHAR(11) NOT NULL
);
-- TABELA ENDERECO CLIENTES
CREATE TABLE client_address (
	CEP CHAR(9), 
	Street VARCHAR(30) NOT NULL, 
	City Varchar(30) NOT NULL, 
	State CHAR(2) NOT NULL,
	Number Int,
	id_client INT PRIMARY KEY,
    CONSTRAINT fk_address_client FOREIGN KEY (id_client) references client(id_client)
);
-- TABELA PRODUTOS (SIZE = DIMENSAO)
CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    p_name VARCHAR(10) NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    category ENUM('Eletronico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Moveis') NOT NULL,
    avaliation FLOAT  DEFAULT 0,
    size VARCHAR(10)
 
);
 -- TABELA PEDIDOS 
CREATE TABLE  order_tab(
	idPaymentType INT NOT NULL, 
	idOrder INT AUTO_INCREMENT PRIMARY KEY, 
    idOrderClient INT NOT NULL,
    orderStatus ENUM('PROCESSANDO','CANCELADO', 'CONFIRMADO','ENTREGUE') NOT NULL DEFAULT 'PROCESSANDO',
	orderDescription VARCHAR(255), 
    shipping FLOAT DEFAULT 10.0,
   
    CONSTRAINT fk_order_client FOREIGN KEY (idOrderClient) references client(id_client)
	-- 	CONSTRAINT fk_order_payment FOREIGN KEY (idPaymentType) references payments(id_payment)
    
    on update cascade
);
-- TABELA PAGAMENTOS 
CREATE TABLE payments (
	id_client INT, 
    id_payment INT PRIMARY KEY AUTO_INCREMENT, 
    value FLOAT,
    typePayment enum ('CARTAO', 'PIX', 'BOLETO'),
   	CONSTRAINT fk_payment_client FOREIGN KEY (id_client) references client(id_client)
	
);
 
 -- ENDEREÇO ESTOQUE
CREATE TABLE storage_address (
	id_storage_address INT PRIMARY KEY auto_increment, 
	Street VARCHAR(30) NOT NULL, 
	City Varchar(30) NOT NULL, 
	State CHAR(2) NOT NULL,
	Number Int
	-- CONSTRAINT fk_address_storage FOREIGN KEY (id_storage_address) references product_storage(id_product_storage)
);
 

-- TABELA ESTOQUE 
CREATE TABLE product_storage ( 
	id_product_location INT, 
	quantity INT DEFAULT 0,
    id_product int, 
    PRIMARY KEY (id_product_location,id_product),
    CONSTRAINT fk_PL_product FOREIGN KEY (id_product) references product(idProduct),
    CONSTRAINT fk_PL_location FOREIGN KEY (id_product_location) references storage_address(id_storage_address)
); 



-- TABELA FORNECEDOR
CREATE TABLE supplier (
	id_supplier INT PRIMARY KEY AUTO_INCREMENT, 
    social_name VARCHAR(255) NOT NULL, 
    CNPJ CHAR(15) NOT NULL, 
    contact VARCHAR(11) NOT NULL, 
	CONSTRAINT unique_supplier UNIQUE (CNPJ)

); 
-- TABELA VENDEDOR
CREATE TABLE seller (
	id_seller INT PRIMARY KEY AUTO_INCREMENT, 
    social_name VARCHAR(255) NOT NULL, 
	abstract_name VARCHAR(255), 
    CNPJ CHAR(15), 
    CPF CHAR(9), 
    contact VARCHAR(11) NOT NULL, 
	CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
	CONSTRAINT unique_cpf_seller UNIQUE (CPF)
); 
-- ENDEREÇO SELLER 
CREATE TABLE seller_address (
	id_seller_address INT, 
	Street VARCHAR(30) NOT NULL, 
	City Varchar(30) NOT NULL, 
	State CHAR(2) NOT NULL,
	Number Int,
	CONSTRAINT fk_seller  FOREIGN KEY (id_seller_address) references seller(id_seller)
);
-- TERCEIRO VENDEDOR
CREATE TABLE product_seller (  
	id_seller INT NOT NULL,
    id_product INT NOT NULL,
    prod_quantity INT DEFAULT 1,
    PRIMARY KEY (id_seller, id_product), 
    CONSTRAINT fk_seller_tab_productseller  FOREIGN KEY (id_seller) references seller(id_seller),
	CONSTRAINT fk_product_tab_productseller  FOREIGN KEY (id_product) references product(idProduct)
) ; 
-- PRODUTOS DE COMPRA
 CREATE TABLE product_order (
 id_PO_prod int, 
 id_PO_order int,
 product_quantity int DEFAULT 1, 
 poStatus ENUM ('DISPONIVEL', 'SEM ESTOQUE') DEFAULT 'DISPONIVEL',
 PRIMARY KEY (id_PO_prod,id_PO_order),
 CONSTRAINT fk_PO_product FOREIGN KEY (id_PO_prod) REFERENCES product(idProduct),
 CONSTRAINT fk_PO_order FOREIGN KEY (id_PO_order) REFERENCES order_tab(idOrder)
 
 );
 
 --  LOCAL DE ESTOQUE
 -- CREATE TABLE storage_location (
 -- id_location_prod int, 
 -- id_location_storage int,
 -- PRIMARY KEY (id_location_prod,id_location_storage),
 -- CONSTRAINT fk_LO_product FOREIGN KEY (id_location_prod) REFERENCES product(idProduct),
 -- CONSTRAINT fk_LO_storage  FOREIGN KEY (id_location_storage) REFERENCES order_tab(idOrder)
 -- );
   -- VENDEDOR PRODUTO
  CREATE TABLE product_supplier (
 id_PS_supplier int, 
 id_PS_product int,
 quantity int NOT NULL, 
  
 PRIMARY KEY (id_PS_supplier,id_PS_product),
 CONSTRAINT fk_PS_product FOREIGN KEY (id_PS_product) REFERENCES product(idProduct),
 CONSTRAINT fk_PS_supplier FOREIGN KEY (id_PS_supplier) REFERENCES supplier(id_supplier)
 
 );
 
 ALTER TABLE client auto_increment = 1;
 ALTER TABLE seller auto_increment = 1;
 ALTER TABLE supplier auto_increment = 1;
 ALTER TABLE product_storage auto_increment = 1;
ALTER TABLE order_tab auto_increment = 1;
ALTER TABLE product auto_increment = 1;
ALTER TABLE payments auto_increment = 1;
ALTER TABLE storage_address auto_increment = 1;
 
-- 	DESC storage_location;
       
	DESC client;
    DESC client_address;
    DESC product;
    DESC order_tab;
    DESC product_order;
    DESC seller;
    DESC payments;
	DESC supplier;
	DESC product_storage;
    DESC storage_address;
    DESC product_supplier;
	DESC product_seller;
    DESC seller_address;
    
    show tables;
    
    -- VALORES TABELA CLIENTES
    
    INSERT INTO client (f_name,m_name,l_name,CPF) values ('Maria','M','Silva', '12346789' ); 
	INSERT INTO client (f_name,m_name,l_name,CPF) values ('Maria','M','Silva', '12346789' ); 
    INSERT INTO client (f_name,m_name,l_name,CPF) values ('Roronoa','Z','ORO', '14546789' ); 
    INSERT INTO client (f_name,m_name,l_name,CPF) values ('Goku','S','Son', '52646789' ); 
    INSERT INTO client (f_name,m_name,l_name,CPF) values ('friedrich','W','Nietzsche', '16646769' ); 
    
    -- ALTERAR OS VALORES DO ID 2 
    UPDATE client 
    SET f_name = 'Money', 
	m_name = 'D', 
    l_name = 'luffy', 
    CPF = '12344589'
    WHERE id_client =2;
    
    
    -- VALORES ENDEREÇO DOS CLIENTES
    
    INSERT INTO client_address (CEP,Street,City,State,Number,id_client) values ('03544-111','rua silva de prata','carangola', 'LN',110, 1 ) ;
    INSERT INTO client_address (CEP,Street,City,State,Number,id_client) values ('03645-122','rua goingo merry','oceano', 'RL',888, 2 ) ;
    INSERT INTO client_address (CEP,Street,City,State,Number,id_client) values ('03645-122','rua goingo merry','oceano', 'RL',888, 3 ) ;
    INSERT INTO client_address (CEP,Street,City,State,Number,id_client) values ('03957-134','rua do kame','ilha distante', 'SJ',135, 4 ) ;
    INSERT INTO client_address (CEP,Street,City,State,Number,id_client) values ('03544-111','rua do niilismo','Rocken', 'NA',669, 5 ) ;
    
    
    -- AUMENTAR O TAMANHO DO VARCHAR 
    ALTER TABLE product
    MODIFY COLUMN p_name VARCHAR(20); 
    
    -- PRODUTOS 
    INSERT INTO product (p_name,classification_kids,category, avaliation, size) values 
    ('Fones de ouvido',false,'Eletronico','4',NULL),
    ('Barbie Elsa',true,'Brinquedos','3',NULL),
    ('Body Carters',true,'Vestimenta','4',NULL),
    ('Microfone vedo',false,'Eletronico','4',NULL),
    ('Sofá retratio',false,'Moveis','5',NULL),
    ('chocolate',true,'Alimentos','5',NULL),
	('fire stick',false,'Eletronico','3',NULL);
    

ALTER TABLE  order_tab   
MODIFY COLUMN  idPaymentType enum('CARTAO','PIX','BOLETO');
  

    -- VALORES TABELA ORDER
    INSERT INTO order_tab (idOrderClient,orderStatus,orderDescription,shipping,idPaymentType) values 
    (1,'PROCESSANDO','APP',1.0,'PIX'),
	(2,'CANCELADO','APP',1.0,'CARTAO'),
	(3,'CONFIRMADO','WEB-SITE',50.0,'CARTAO'),
	(4,'ENTREGUE','WEB-SITE',150.0,'BOLETO');
    
    
      -- VALORES TABELA PRODUCT ORDER
    INSERT INTO product_order (id_PO_prod,id_PO_order,product_quantity,poStatus) values 
    (1,1,2,'DISPONIVEL'),
	(2,2,1,'DISPONIVEL'),
    (3,3,0,'DISPONIVEL'),
    (3,4,2,'DISPONIVEL');
 
    
    -- VALORES SELLER 
    
    INSERT INTO seller (social_name, abstract_name, CNPJ, CPF, contact) values 
    ('1001 N & Loja', 'lojas mil e uma noites', '0123456789-1234',NULL,'11912441122'),
	('findiLoja', 'loja fim do mundo', '0145456789-1444',NULL,'11914441133'),
    ('Jose das vendas', null, NULL,489240701,'11915551133');
  
  
  -- VALORES PAGAMENTO
	INSERT INTO payments (id_client, value, typePayment) values 
    (1,150.0,'CARTAO'),
    (1,550.0,'PIX'),
    (2,430.0,'CARTAO'),
    (2,530.0,'BOLETO'),
    (3,1330.0,'CARTAO'),
	(4,9500.0,'PIX');
  

    -- VALORES TABELA FORNECEDOR 
    INSERT INTO supplier (social_name,CNPJ,contact) values 
    ('Vendas Amazonicas','0458954789-1234' ,11969851133),
	('aeromarino','0699966789-1234' ,11914451133),
    ('Choco Silva','1339966789-1234' ,11914451133);
    
    
    
    -- informações localização do estoque
    INSERT INTO storage_address (Street, City, State, Number) values 
    ('Rua da Loja', 'Sao Paulo', 'SP', 101),
    ('Rua da Cerejeira', 'Rio de Janeiro', 'RJ', 1331),
    ('Chester Bull', 'Minas Gerais', 'MG', 5531);
    
    
    -- informações estoque produtos
     
    DESC product_storage;
    INSERT INTO product_storage (id_product, quantity, id_product_location ) values 
    (1,150, 1),
    (2,33 , 1),
    (4,8 , 2),
    (5,3, 2),
    (6,1000, 3),
    (7,100 ,1);

    
    -- INFORMAÇÕES PRODUTOS FORNECEDOR 
 
    INSERT INTO product_supplier (id_PS_supplier, id_PS_product, quantity) values 
    (1,1,10),
    (2,2,20),
    (1,3,5),
    (2,4,10),
    (1,5,2),
    (3,6,1000),
    (1,7,200);
    
    --  INFORMAÇÕES VENDEDORES TERCEIROS 
    
    INSERT INTO product_seller (id_seller, id_product, prod_quantity) values 
    (1,1,2),
    (1,6,4),
    (1,2,3),
    (2,4,1),
    (3,5,1),
    (3,7,5);
    
    -- ENDEREÇO VENDEDOR 
    INSERT INTO seller_address (id_seller_address, Street, City, State, Number) values 
    (1, 'Rua de trás', 'NeverLand', 'NL', '11'),
    (2, 'Rua joao Tadeu ', 'Sao Paulo', 'SP', '133'),
    (3, 'Rua Armando', 'Rio de janeiro', 'RJ', '155');
    
    
    SELECT * FROM client;
    SELECT * FROM client_address;
    SELECT * FROM product;
    SELECT * FROM order_tab;
    SELECT * FROM product_order;
	SELECT * FROM SELLER;
    SELECT * FROM payments;
    SELECT * FROM supplier;
    SELECT * FROM storage_address;
    SELECT * FROM product_storage;
    SELECT * FROM product_supplier;
    SELECT * FROM product_seller;
    SELECT * FROM seller_address;
    
    -- PROCURAR TODOS ENDEREÇOS DE TODOS CLIENTES
    SELECT CONCAT(f_name,' ' , m_name,' ' ,l_name) AS nome, CPF, CONCAT(Street, ' numero : ' , Number) AS ENDERECO, State, City 
    FROM client 
    INNER JOIN client_address 
    ON client.id_client = client_address.id_client
    ORDER BY f_name asc ;
    
     -- QUERY PROCURAR PRODUTOS POR PEDIDO
     
    SELECT p_name, category, avaliation, idPaymentType, orderStatus, orderDescription, shipping 
    FROM product_order 
    INNER JOIN product 
    ON product.idproduct = product_order.id_PO_prod
    INNER JOIN order_tab 
    ON order_tab.idOrder = product_order.id_PO_order;
    
   
   -- Procurar pedidos CANCELADOS 
   
    SELECT p_name, product_quantity, idPaymentType, orderStatus,orderDescription
    FROM product_order p_o
    INNER JOIN order_tab o_t
    ON o_t.idOrder = p_o.id_PO_order
    INNER JOIN product p
    ON p.idProduct = p_o.id_PO_prod
    WHERE orderStatus = 'CANCELADO';
    
    -- VERIFICAR ENDEREÇO VENDEDORES
    SELECT social_name, CONCAT(Street,' ', City, ' numero : ', Number) AS endereco  
    FROM SELLER s
    INNER JOIN seller_address s_a 
    ON id_seller_address = s.id_seller;
    
    
    -- VERIFICAR QUANTIDADE E ENDERECO DE PRODUTO EM ESTOQUE 
    
     SELECT p_name, CONCAT(Street,' ', City) AS endereco, category, quantity 
     FROM product_storage p_s 
     INNER JOIN storage_address s_a
     ON s_a.id_storage_address = p_s.id_product_location
     INNER JOIN product p
     ON p.idProduct = p_s.id_product
     ORDER BY quantity;    ;
     
     
 

    SELECT * FROM storage_address;
        SELECT * FROM product;
          SELECT * FROM product_storage;

    

    