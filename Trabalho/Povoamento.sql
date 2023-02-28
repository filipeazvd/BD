USE livraria;
 

INSERT INTO cliente
	(NIF, Contacto, Nome, `Código de Postal`, Localidade, Rua)
    VALUES 
    (254876589, 914578455, 'João Gonçalo', '1000-124', 'Lisboa', 'Rua da Madalena'), 
    (547856974, 919662666, 'Alberto Ronaldo', '2450-023', 'Famalicão Nazaré', 'Rua José Pinto Sá'),
    (526421477, 919666667, 'Marta Suares', '2450-335', 'Nazaré', 'Rua dos Bacalhoeiros'),
	(225424587, 912563598, 'José Alcino', '2400-827', 'Leiria', 'Rua do Carmo'),
    (589424525, 966785241, 'Catarina Maia', '4910-023', 'Caminha', 'Rua do Fado Português'),
    (526524564, 252658747, 'Tozé Da Quinta', '4941-909', 'Paredes de Coura', 'Rua das Laranjeiras'),
    (726424588, 911452365, 'Esdrubaldo Maurício', '2400-823', 'Leiria', 'Rua de São Bento'),
    (326444590, 961435315, 'Esdrubaldo Moisés', '4500-423', 'Porto', 'Rua do Aires'),
    (226354688, 914452322, 'Nick Ger', '4500-943', 'Porto', 'Rua do Pão Seco'),
    (126434219, 961434578, 'João Barbatana', '2300-313', 'Viana do Castelo', 'Rua do Amongo');
    

    
INSERT INTO funcionário
	(idFuncionário, Nome, Contacto)
    VALUES
    (1, 'Filipe Azevedo', 910666578),
    (2, 'João Vítor', 914528777),
    (3, 'Diogo Fernandes', 965874587),
    (4, 'David Gonçalves', 932588965);
    

INSERT INTO livros
	(Nome, Tema, Autor, PreçoL, Quantidade)
    VALUES
    ('Chainsaw Man', 'Ação/Drama', 'Tatsuki Fujimoto', 9.99, 21),
    ('Dune', 'Ficção Científica', 'Frank Herbert', 13.99, 50),
    ('Little Women', 'Ficção Doméstica', 'Louisa May Alcott', 15.99, 35),
    ('Neon Genesis Evangelion', 'Drama Psicológico/Apocalíptico', 'Akio Satsukawa', 20, 105),
    ('Harry Potter - Phoenix' , 'Drama/Fantasia', 'J. K. Rowling', 15.99, 200),
    ('Harry Potter - The Squid Master', 'Comédia/Fantasia', 'J. K. Rowling', 9.99, 10),
    ('The Rabbit Hole', 'Fantasia', 'John Lennon Jr.', 11.45, 32),
    ('Suspect' , 'Drama/Mistério', 'João Vermelho', 12.42, 20);
    
INSERT INTO veículo
	(Matrícula, Marca, Modelo)
    VALUES 
    ('24-UA-26','Ford','Transit'),
    ('UO-57-12', 'Peugot', 'Van'),
    ('25-KL-69', 'Bugatti', 'Chiron');
  

INSERT INTO fornecedor
	(idFornecedor, Nome)
    VALUES
    (1, 'Bertrand'),
    (2, 'Cartucho'),
    (3, 'Zowie');


 
INSERT INTO fornecimento_has_livros
	(id, Livros_Nome, Fornecedor_IdFornecedor, Quantidade, `Data`)
    VALUES
    (1,'Chainsaw Man', 1, 5, '2022-7-10'),
    (2,'Neon Genesis Evangelion', 1, 10, '2022-7-15'),
    (3,'Suspect', 2, 5, '2022-7-23'),
    (4,'Dune', 3, 14, '2022-8-10');


INSERT INTO encomenda
	(idEncomenda,`Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`, `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula)
    VALUES
    (1, 'Rua da Madalena', 'Paga', 'Paysafecard', '2022/10/22', '2022/10/23', 1, 254876589, '24-UA-26'),
    (2, 'Rua da Madalena', 'Paga', 'Cartão de Crédito', '2022/10/22', '2022/10/23', 1, 254876589, '24-UA-26'),
    (3, 'Rua José Pinto Sá', 'Paga', 'MBway', '2022/10/22', '2022/10/23', 2, 547856974, 'UO-57-12'),
    (4, 'Rua dos Bacalhoeiros', 'Paga', 'Cartão de Débito', '2022/10/22', '2022/10/23', 3, 526421477, '25-KL-69'),
    (5, 'Rua dos Bacalhoeiros', 'Paga', 'Paysafecard', '2022/10/22', '2022/10/23', 2, 526421477, '24-UA-26'),
    (6, 'Rua do Carmo', 'Entregue', 'Cartão de Crédito', '2022/10/21', '2022/10/22', 4, 225424587, '25-KL-69'),
    (7, 'Rua do Fado Português', 'Entregue', 'Bitcoin', '2022/10/21', '2022/10/22', 1, 589424525, 'UO-57-12'),
    (8,'Rua das Laranjeiras', 'Entregue', 'Cartão de Crédito', '2022/10/21', '2022/10/22', 4, 526524564, '25-KL-69'),
    (9, 'Rua de São Bento', 'Entregue', 'Paypal', '2022/10/20', '2022/10/21', 3, 726424588, '25-KL-69'),
    (10, 'Rua do Aires', 'Entregue', 'Cartão de Crédito', '2022/10/20', '2022/10/21', 2, 326444590, 'UO-57-12'),
    (11, 'Rua do Pão Seco', 'Entregue', ' Cartão de Crédito', '2022/10/20', '2022/10/21', 1, 226354688, 'UO-57-12'),
    (12,'Rua do Amongo', 'Entregue', 'Bitcoin', '2022/10/20', '2022/10/21', 4, 126434219, '25-KL-69');
    


INSERT INTO encomenda_has_livros
	(Encomenda_idEncomenda, Livros_Nome, Quantidade)
    VALUES
    (1, 'Chainsaw Man', 2),
    (1, 'Dune', 1),
    (2, 'Harry Potter - Phoenix', 1),
    (3, 'Harry Potter - The Squid Master', 1),
    (3, 'Harry Potter - Phoenix', 1),
    (4, 'Neon Genesis Evangelion', 2),
    (4, 'Chainsaw Man', 2),
    (5, 'Little Women', 1),
    (6, 'Dune', 1),
    (7, 'Suspect', 1),
    (8, 'The Rabbit Hole', 1),
    (8, 'Dune', 2),
    (9, 'Neon Genesis Evangelion', 1),
    (10, 'Little Women', 25),
    (10, 'Neon Genesis Evangelion', 26),
    (11, 'Chainsaw Man', 1),
    (12, 'Dune', 1),
    (12, 'Suspect', 1);
    

DELIMITER $$
CREATE PROCEDURE `insereCliente` (IN NIF INT, IN Contacto INT, IN Nome VARCHAR(45),
 IN `Código de Postal` CHAR(8), IN Localidade VARCHAR(30), IN Rua VARCHAR(90))
BEGIN
		INSERT INTO cliente (NIF, Contacto, Nome, `Código de Postal`, Localidade, Rua)
	VALUE (NIF, Contacto, Nome, `Código de Postal`, Localidade, Rua);
END $$
 
 
 
DELIMITER $$
CREATE PROCEDURE `insereEncomenda` (IN idEncomenda INT,
 IN `Local de Entrega` VARCHAR(100), IN Estado VARCHAR(15),
 IN `Tipo de Pagamento` VARCHAR(40), IN `Data de Encomenda` DATE,
 IN `Data de Entrega` DATE, IN Funcionário_idFuncionário INT, IN Cliente_NIF INT, IN Veículo_Matrícula CHAR(8))
BEGIN 
		INSERT INTO encomenda (idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`, `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula)
	VALUE (idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`, `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula);  
END $$
 
DELIMITER $$
CREATE PROCEDURE `insereEncomenda_has_livros` (IN Encomenda_idEncomenda INT, IN Livros_Nome VARCHAR(45), IN Quantidade INT)
BEGIN
		INSERT INTO encomenda_has_livros (Encomenda_idEncomenda, Livros_Nome, Quantidade)
	VALUE (Encomenda_idEncomenda, Livros_Nome, Quantidade);
END $$

    

 
 
 
 
DELIMITER $$
CREATE PROCEDURE `insereFuncionário` (IN idFuncionário INT, IN Nome VARCHAR(45), IN Contacto INT)
BEGIN
		INSERT INTO funcionário (idFuncionário, Nome, Contacto)
	VALUE (idFuncionário, Nome, Contacto);
END $$
 
 
 
 
 DELIMITER $$
 CREATE PROCEDURE `insereLivro` (IN Nome VARCHAR(45), IN Tema VARCHAR(45), IN Autor VARCHAR(45), IN PreçoL FLOAT, IN Quantidade INT)
BEGIN
		INSERT INTO livros (Nome, Tema, Autor, PreçoL, Quantidade)
	VALUE (Nome, Tema, Autor, PreçoL, Quantidade);
END $$
 
 
 
 
 DELIMITER $$
 CREATE PROCEDURE `insereVeículo` (IN Matrícula CHAR(8), IN Marca VARCHAR(20), IN Modelo VARCHAR(20))
BEGIN
		INSERT INTO veículo (Matrícula, Marca, Modelo)
	VALUE (Matrícula, Marca, Modelo);
END $$ 



DELIMITER $$
CREATE PROCEDURE `insereFornecedor`(IN idFornecedor INT, IN Nome VARCHAR(45))
BEGIN
		INSERT INTO fornecedor (idFornecedor, Nome)
	VALUE (idFornecedor, Nome);
END $$
 
 

 select * from fornecimento_has_livros
 
DELIMITER $$
CREATE PROCEDURE `insereFornecimentoHasLivros`(IN id INT, IN Livros_Nome VARCHAR(45), IN Fornecedor_idFornecedor INT, IN Quantidade INT, IN `Data` DATE)
BEGIN
		INSERT INTO fornecimento_has_livros (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`)
	VALUE (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`);
    
    
END $$


DELIMITER $$
CREATE PROCEDURE `insereEncomendaFinal` (IN idEncomenda INT,
 IN `Local de Entrega` VARCHAR(100), IN Estado VARCHAR(15),
 IN `Tipo de Pagamento` VARCHAR(40), IN `Data de Encomenda` DATE,
 IN `Data de Entrega` DATE, IN Funcionário_idFuncionário INT, IN Cliente_NIF INT, IN Veículo_Matrícula CHAR(8),
 IN Livro1 VARCHAR(40), IN Qnt1 INT, IN Livro2 VARCHAR(40), IN Qnt2 INT, IN Livro3 VARCHAR(40), IN Qnt3 INT)
 
 BEGIN
 
	DECLARE var1 INT DEFAULT 0;
	DECLARE var2 INT DEFAULT 0;
    DECLARE var3 INT DEFAULT 0;
    
    DECLARE ErroTransacao BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET ErroTransacao = 1;
    
	START TRANSACTION;
			
            SELECT livros.Quantidade from livros
            WHERE livros.Nome = Livro1 Into var1;
            
            SELECT livros.Quantidade from livros
            WHERE livros.Nome = Livro2 Into var2;
            
            SELECT livros.Quantidade from livros
            WHERE livros.Nome = Livro3 Into var3;
		
            IF (Livro1 != '0' AND Qnt1 != 0 AND Livro2 = '0' AND Qnt2 = 0 AND Livro3 = '0' AND Qnt3 = 0 AND var1 >= Qnt1)
				THEN 	INSERT INTO encomenda(idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`,
                `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula)
						VALUE (idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`, `Data de Entrega`,
                        Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula);
			
						INSERT INTO encomenda_has_livros (Encomenda_idEncomenda, Livros_Nome, Quantidade)
						VALUE (idEncomenda, Livro1, Qnt1);
                        
			ELSE IF (Livro1 != '0' AND Qnt1 != 0 AND Livro2 != '0' AND Qnt2 != 0 AND Livro3 = '0' AND Qnt3 = 0 AND var1 >= Qnt1 AND var2 >= Qnt2)
						THEN 	INSERT INTO encomenda(idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`,`Data de Encomenda`,
                        `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula)
								VALUE (idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`,
                                `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula);
			
                        
								INSERT INTO encomenda_has_livros (Encomenda_idEncomenda, Livros_Nome, Quantidade)
								VALUE (idEncomenda, Livro1, Qnt1);
                                
								INSERT INTO encomenda_has_livros (Encomenda_idEncomenda, Livros_Nome, Quantidade)
								VALUE (idEncomenda, Livro2, Qnt2);
				ELSE IF (Livro1 != '0' AND Qnt1 != 0 AND Livro2 != '0' AND Qnt2 != 0 AND Livro3 != '0' AND Qnt3 != 0 AND var1 >= Qnt1 AND var2 >= Qnt2 AND var3 >= Qnt3)
						
						THEN 	INSERT INTO encomenda(idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`,
                        `Data de Encomenda`, `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula)
								VALUE (idEncomenda, `Local de Entrega`, Estado, `Tipo de Pagamento`, `Data de Encomenda`,
                                `Data de Entrega`, Funcionário_idFuncionário, Cliente_NIF, Veículo_Matrícula);
			
                        
								INSERT INTO encomenda_has_livros (Encomenda_idEncomenda, Livros_Nome, Quantidade)
								VALUE (idEncomenda, Livro1, Qnt1);
								INSERT INTO encomenda_has_livros (Encomenda_idEncomenda, Livros_Nome, Quantidade)
								VALUE (idEncomenda, Livro2, Qnt2);
								INSERT INTO encomenda_has_livros (Encomenda_idEncomenda, Livros_Nome, Quantidade)
								VALUE (idEncomenda, Livro3, Qnt3);
                    END IF;            
				END IF;
            END IF;
            IF ErroTransacao THEN
				ROLLBACK;
			ELSE 
				COMMIT;
			END IF;
	END $$
  
  
  
  DELIMITER $$
CREATE PROCEDURE `insereFornecimentoFinal` (IN id INT, IN Livro1 VARCHAR(45),IN Livro2 VARCHAR(45), IN Livro3 VARCHAR(45),
IN Qnt1 INT,IN Qnt2 INT,IN Qnt3 INT, IN Fornecedor_idFornecedor INT, IN `Data` DATE)
 
 BEGIN
 
    
    DECLARE ErroTransacao BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET ErroTransacao = 1;
    
	START TRANSACTION;
			
           
		
            IF (Livro1 != '0' AND Livro2 = '0' AND Livro3 = '0' AND Qnt1 > 0)
				THEN 	INSERT INTO fornecimento_has_livros (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`)
						VALUE (id, Livro1, Fornecedor_idFornecedor, Qnt1, `Data`);
			
						
                        
			ELSE IF (Livro1 != '0' AND Livro2 != '0' AND Livro3 = '0' AND Qnt1 >0 AND Qnt2 >0)
						THEN 	INSERT INTO fornecimento_has_livros (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`)
								VALUE (id, Livro1, Fornecedor_idFornecedor, Qnt1, `Data`);
			
                        
								INSERT INTO fornecimento_has_livros (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`)
								VALUE (id, Livro2, Fornecedor_idFornecedor, Qnt2, `Data`);
                                
								
				ELSE IF (Livro1 != '0' AND Livro2 != '0' AND Livro3 != '0' AND Qnt1 >0 AND Qnt2 >0 AND Qnt3 >0 )
						
						THEN 	INSERT INTO fornecimento_has_livros (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`)
								VALUE (id, Livro1, Fornecedor_idFornecedor, Qnt1, `Data`);
			
                        
								INSERT INTO fornecimento_has_livros (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`)
								VALUE (id, Livro2, Fornecedor_idFornecedor, Qnt2, `Data`);
                                
                                INSERT INTO fornecimento_has_livros (id, Livros_Nome, Fornecedor_idFornecedor, Quantidade, `Data`)
								VALUE (id, Livro3, Fornecedor_idFornecedor, Qnt3, `Data`);
                    END IF;            
				END IF;
            END IF;
            IF ErroTransacao THEN
				ROLLBACK;
			ELSE 
				COMMIT;
			END IF;
	END $$



#Função para inserção de um fornecimento: (ID do fornecimento, Livro1, Livro2, Livro3, Quantidade do Livro1, Quantidade do Livro2, Quantidade do Livro3, ID do fornecedor, Data do fornecimento em questão)
#Se apenas fornecer um livro, colocar no Livro2,Qnt2,Livro3,Qnt3, 0 como parametro
#Se apenas forneceder dois livros, colocar no Livro3,Qnt3, 0 como parametro
#Se fornecer tres livros, preencher todos os parametros normalmente
# Quantidades tem que ser maiores que 0 senão nao acontece nada
#Um fornecimento é feito apenas por só um fornecedor
#limite maximo 3 livros por fornecimento, implementado para controlar melhor e organizar
call insereFornecimentoFinal(12,'Chainsaw Man','0','0',1,0,0,1,'2023-01-10');

#Função de inserção de uma encomenda assim como o seu conteúdo
#Recebe: (ID,Rua,Estado,TipoPagamento,DataquefoiEncomendada,DataEntrega,idFuncionario,NifCliente,Matricula,Livro1,Qnt1,Livro2,Qnt2,Livro3,Qnt3)
#Se a encomenda tiver um livro, colocar no Livro2,Qnt2,Livro3,Qnt3, 0 como parametro
#Se a encomenda tiver dois livros, colocar no Livro3,Qnt3, 0 como parametro
#Se a encomenda tiver tres livros, preencher todos os parametros normalmente
#Limite maximo 3 livros por encomenda,  implementado para controlar melhor e organizar
call insereEncomendaFinal(24,'Rua do Amongo','Entregue','Dogecoin','2000-07-22','2000-07-23', 2,126434219 , 'UO-57-12', 'Hail Marry',1,'0',0,'0',0);

#Função de inserção de fornecimentos antiga(Funciona mas nao se deve usar para evitar problemas)
call insereFornecimentoHasLivros(10,'Chainsaw Man', 2, 1, '2023-01-10');

#Função de inserção de um cliente
call inserecliente(123456789, 123456789, 'teste','1234-124','teste','teste');

#Função de inserção de uma encomenda antiga(Funciona mas nao se deve usar para evitar problemas)
call insereEncomenda(14,'Rua do Sésamo','Paga','MBway','2000-07-21','2000-07-23', 4, 254876589, 'UO-57-12');

#Função para inserir o conteúdo de uma encomenda antiga(Nao usar para evitar problemas)
call insereEncomenda_has_livros(14,'Chainsaw Man',1);

#Função de inserção de um funcionario
call insereFuncionário();

#Função de inserção de um livro
call insereLivro('Hail Marry','Ficção Científica', 'John Qqr coisa', '20.00', 0);

#Função de inserção de um veículo
call insereVeículo();

#Função de inserção de um fornecedor
call insereFornecedor();




            
    
    
    