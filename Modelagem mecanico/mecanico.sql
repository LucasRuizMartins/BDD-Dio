
-- drop database oficina_mecanica;
CREATE DATABASE oficina_mecanica ; 

USE oficina_mecanica; 


-- CRIAR TABELA CLIENTES
CREATE TABLE tb_client (
    CPF CHAR(11) PRIMARY KEY, 
    p_nome VARCHAR(20) NOT NULL,
    m_nome VARCHAR(20) NOT NULL,
    f_nome VARCHAR(20) NOT NULL

); 

INSERT INTO tb_client (CPF, p_nome, m_nome, f_nome) values 
(12345600708, 'Jose', 'Saramago', 'Silva'), 
(13457700708, 'João', 'das Moto', 'Astolfo'), 
(13667788991, 'Arthur', 'Beltrão', 'Cafona'), 
(12244789101, 'Liliam', ' Celta', 'Brancalhão'); 


-- TABELA ENDEREÇO DOS CLIENTES
CREATE TABLE tb_client_address (
    client_cpf CHAR(11) PRIMARY KEY, 
    rua VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    UF CHAR(2) NOT NULL DEFAULT 'SP',
    CEP CHAR(9),
    numero INT NOT NULL,
    CONSTRAINT fk_client_address FOREIGN KEY (client_cpf) REFERENCES tb_client(CPF)
);

INSERT INTO tb_client_address (client_cpf, rua, cidade, UF, CEP, numero) values 
(12345600708, 'Rua de trás', 'São Paulo', 'SP', '04587-990', 122), 
(13457700708, 'Rua dos Joãos', 'Ninguem Landia', 'NG','05587-990', 122), 
(13667788991, 'Rua dos Joãos', 'Ninguem Landia', 'NG','05587-990', 145), 
(12244789101, 'AV. Francisco Morato', ' Franciscania', 'FR', '01388-910', 1135);

CREATE TABLE tb_vehicle ( 
    client_cpf CHAR(11),
    plate VARCHAR(8) NOT NULL, 
    primary key(client_cpf, plate),
    vehicle_mark VARCHAR(45) NOT NULL,
    CONSTRAINT fk_client_plate FOREIGN KEY (client_cpf) REFERENCES tb_client(CPF)

);


INSERT INTO tb_vehicle (client_cpf, plate, vehicle_mark) values 
(12345600708, 'ABC-4477', 'FORD'), 
(12345600708, 'ADC-4579', 'TOYOTA'), 
(13457700708, 'ADE-4445', 'RENAULT'), 
(13667788991, 'FLW-4444', 'RENAULT'), 
(12244789101, 'ADI-4141', 'VOLKSWAGEN');


CREATE TABLE tb_mechanical (
    mechanical_id INT PRIMARY KEY AUTO_INCREMENT, 
    p_nome VARCHAR(20),
    m_nome CHAR(1), 
    f_nome VARCHAR(20), 
    especiality VARCHAR(20) DEFAULT 'AUXILIAR'

); 

ALTER TABLE tb_mechanical auto_increment = 1;



INSERT INTO tb_mechanical (p_nome,m_nome,f_nome,especiality ) values 
('Andre', 'J', 'Santos' , 'Motos' ), 
('Francisco', 'J', 'Santos' , 'Carros' ), 
('Frederico', 'F', 'Niti' , 'Carros' ), 
('Douglas', 'S', 'Silva' , 'Importados' ), 
('Chaves', 'S', 'dos santos' , 'Importados' ),
('Arnaldo', 'D', 'Matos', 'AUXILIAR' ),
('Joao', 'F', 'Silva', 'AUXILIAR' ); 



CREATE TABLE mechanical_team (
    team_name VARCHAR(25),
    team_id INT PRIMARY KEY AUTO_INCREMENT  
    
 ); 

 ALTER TABLE mechanical_team auto_increment = 1;

INSERT INTO mechanical_team (team_name) values 
('Motos Manhã'),
('Carros Tarde'),
('Importados'),
('serviços gerais');
 
CREATE TABLE team_in_service (
    mechanical_id INT , 
    mechanical_team_id INT, 

    
    CONSTRAINT fk_TS_mechanical_id FOREIGN KEY(mechanical_id) references tb_mechanical(mechanical_id),
    CONSTRAINT fk_TS_team_id FOREIGN KEY(mechanical_team_id) references mechanical_team(team_id)
    
 ); 
 
 -- drop database oficina_mecanica;
 
 SELECT * FROM team_in_service;
 SELECT * FROM tb_mechanical;
 desc mechanical_team;


 SELECT * FROM mechanical_team;
  
  
   desc team_in_service;
 
 
 INSERT INTO team_in_service (     mechanical_id   ,     mechanical_team_id ) VALUES 
	(1,1),
    (2,2),
    (3,2),
    (4,3),
    (5,3),
    (6,4),
    (7,4);

 

CREATE TABLE mechanical_pieces(
    mechanical_pieces_id INT AUTO_INCREMENT PRIMARY KEY, 
    piece_name VARCHAR(45),
    quantity INT, 
    price float
 ); 


ALTER TABLE mechanical_pieces auto_increment = 1;

INSERT INTO mechanical_pieces (piece_name, quantity, price) values 
('motor v5', 10 , 3250.0),
('volante', 5 , 325.0),
('Porta', 10 , 550.0),
('Cambio Automatico', 25 , 200.0),
('Vidro', 50 , 70.0);






CREATE TABLE labor_price(
id_labor_price INT PRIMARY KEY AUTO_INCREMENT, 
value_base FLOAT DEFAULT 100.0,
specialization_value FLOAT,
service_type VARCHAR(30) DEFAULT 'MANUTENÇÃO'

 ); 

ALTER TABLE labor_price auto_increment = 1;

INSERT INTO labor_price (specialization_value, service_type) values 
(250.0,'Motos'), 
(450.0,'IMPORTADOS'), 
(350.0, 'Carros'), 
(220.0, 'funilaria');


CREATE TABLE service_order(
id_service_order INT PRIMARY KEY AUTO_INCREMENT, 
service_start_date DATE,
service_preview_conclusion_date DATE, 
service_status ENUM('COTAÇÃO','PROCESSAMENTO','CONCLUIDO','NEGADO'),
team_in_service INT, 
vehicle_plate CHAR(8),
labor_price_id INT,
CONSTRAINT FK_SO_team_service FOREIGN KEY(team_in_service )  REFERENCES team_in_service(mechanical_team_id),
CONSTRAINT FK_SO_labor_price FOREIGN KEY(labor_price_id )  REFERENCES labor_price(id_labor_price)
 ); 
 
 
-- total_value FLOAT,


ALTER TABLE labor_price auto_increment = 1;
desc service_order;

INSERT INTO service_order (service_start_date, service_preview_conclusion_date,service_status,team_in_service,vehicle_plate, labor_price_id) VALUES 
('2022-09-20', '2022-09-24', 'PROCESSAMENTO', 1 , 'ADI_4141',1  ),
('2022-09-20', NULL , 'COTAÇÃO', 3  ,'ABC-4477',2  ),
('2022-07-15', '2022-07-25','CONCLUIDO'  , 2 , 'ADC-4579',3  ),
('2022-08-15', '2022-08-20'  ,'CONCLUIDO' , 2, 'ADC-4579',3  ),
('2022-06-08', '2022-07-18'  ,'CONCLUIDO' , 2, 'ADC-4579',3  ),
('2022-02-08',null , 'CONCLUIDO', 4 , 'ADC-4579',3  );


 CREATE TABLE mechanical_pieces_in_service (
    mechanical_pieces_id INT, 
    id_service_order INT ,
    
    CONSTRAINT fk_PS_mechanical_pieces  FOREIGN KEY(mechanical_pieces_id) REFERENCES mechanical_pieces(mechanical_pieces_id),
    CONSTRAINT fk_PS_service_order  FOREIGN KEY(id_service_order) REFERENCES service_order(id_service_order)
 ); 
 
 INSERT INTO mechanical_pieces_in_service (mechanical_pieces_id,id_service_order) VALUES 
 (5,1),
 (1,2),
 (2,3),
 (3,4),
 (4,5),
 (5,6);
 

 
SELECT * FROM mechanical_pieces;
SELECT * FROM tb_vehicle;
SELECT * FROM labor_price;
SELECT * FROM team_in_service;
SELECT * FROM tb_mechanical;
SELECT * FROM mechanical_team;
SELECT * FROM service_order;
SELECT * FROM mechanical_pieces;

-- CONFERIR ESPECIALIDADE DOS TIMES
SELECT especiality, team_name, team_id
FROM team_in_service t_s
INNER JOIN tb_mechanical m
ON m.mechanical_id = t_s.mechanical_id
INNER JOIN mechanical_team m_s
ON m_s.team_id = t_s.mechanical_team_id
ORDER BY team_id;


-- VALOR TOTAL DE UM SERVIÇO

SELECT team_name, service_type, vehicle_plate, service_status, service_preview_conclusion_date, SUM(value_base + specialization_value + price) AS valor_total

FROM service_order S_O
INNER JOIN mechanical_team M_S
ON M_S.team_id = S_O.team_in_service
INNER JOIN labor_price L_S
ON L_S.id_labor_price = S_O.labor_price_id
INNER JOIN mechanical_pieces_in_service M_P_S
ON M_P_S.id_service_order = S_O.id_service_order
INNER JOIN mechanical_pieces M_P
ON M_P.mechanical_pieces_id = M_P_S.mechanical_pieces_id
GROUP BY  S_O.id_service_order
ORDER BY S_O.id_service_order;

 
 
 -- VALORES TOTAL POR MÊS 
SELECT DATE_FORMAT(`service_start_date`,'%M') `month`, SUM(value_base + specialization_value + price) AS lucro_do_mes

FROM service_order S_O
INNER JOIN mechanical_team M_S
ON M_S.team_id = S_O.team_in_service
INNER JOIN labor_price L_S
ON L_S.id_labor_price = S_O.labor_price_id
INNER JOIN mechanical_pieces_in_service M_P_S
ON M_P_S.id_service_order = S_O.id_service_order
INNER JOIN mechanical_pieces M_P
ON M_P.mechanical_pieces_id = M_P_S.mechanical_pieces_id
GROUP BY  DATE_FORMAT(`service_start_date`, '%M');

-- 

SELECT * 
FROM mechanical_pieces_in_service M_P_S
INNER JOIN mechanical_pieces M_P
ON M_P.mechanical_pieces_id = M_P_S.mechanical_pieces_id;




 
 