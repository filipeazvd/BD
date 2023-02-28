#PROCEDURES

DELIMITER $$
CREATE PROCEDURE `visualizarClientes`()
BEGIN
	SELECT * FROM cliente;
END $$

call visualizarClientes();
#encomendas

DELIMITER $$
CREATE PROCEDURE `visualizarEncomendas`()
BEGIN
	SELECT * FROM encomenda;
END$$

#relacao enc/livro

DELIMITER $$
CREATE PROCEDURE `visualizarRelaçãoEncLivro`()
BEGIN
	SELECT * FROM encomenda_has_livros;
END $$

#funcionario

DELIMITER $$
CREATE PROCEDURE `visualizarFuncionário`()
BEGIN
	SELECT * FROM funcionário;
END $$

#livros

DELIMITER $$
CREATE PROCEDURE `visualizarLivros`()
BEGIN
	SELECT * FROM livros;
END $$

#Veículos

DELIMITER $$
CREATE PROCEDURE `visualizarVeículo`()
BEGIN
	SELECT * FROM veículo;
END $$

#visualizar fornecedor
DELIMITER $$
CREATE PROCEDURE `visualizarFornecedor`()
BEGIN
	SELECT * FROM fornecedor;
END $$
#visualizar tabela livros_Has_fornecedores
DELIMITER $$
CREATE PROCEDURE `visualizarFornecimentoHasLivros`()
BEGIN
	SELECT * FROM fornecimento_has_livros;
END $$

#visualizar encomendas de um dado cliente

DELIMITER $$
CREATE PROCEDURE `encomendasDeCLiente` (IN NIF INT)
BEGIN
	SELECT * FROM encomenda
    WHERE encomenda.Cliente_NIF=NIF
    ORDER BY 1 DESC;
    
END $$

#informacao de um livro
DELIMITER $$
CREATE PROCEDURE `infLivro`(IN `Nome do livro` VARCHAR(45))
BEGIN
	SELECT * from livros
    WHERE livros.Nome = `Nome do livro`;
    
END $$

#pelo autor procurar livro
DELIMITER $$
CREATE PROCEDURE `nomedolivro`(IN `Autor` VARCHAR(45))
BEGIN
	SELECT * from livros
    WHERE livros.Autor = `Autor`;
    
END $$ 




DELIMITER $$
CREATE PROCEDURE `encomendasEntreguesPorFuncionario`(IN idFuncionario INT, IN dataInicial DATE, IN dataFinal DATE)
BEGIN
	SELECT * FROM encomenda
    WHERE encomenda.Funcionário_idFuncionário=idFuncionario
    AND encomenda.Estado='Entregue'
    AND dataInicial <= encomenda.`Data de Entrega`
    AND dataFinal >= encomenda.`Data de Entrega`;
END $$

# nº de entregas de um funcionario por dia, ordenadas
USE livraria
SELECT * FROM encomenda;

DELIMITER $$
CREATE PROCEDURE `entregasDosFuncionarios` (IN dia DATE)
BEGIN
	SELECT encomenda.Funcionário_idFuncionário, count(*) AS NrEntregas FROM encomenda
    WHERE encomenda.`Data de Entrega` = dia
    GROUP BY encomenda.Funcionário_idFuncionário
    ORDER BY 1;
END $$
#count(*) conta o numero de aparencias, neste caso do funcionario aparecer na base de dados num certo dia 

#apresentar os veículos mais utilizados

DELIMITER $$
CREATE PROCEDURE `veiculosMaisUtilizados` ()
BEGIN
	SELECT encomenda.Veículo_Matrícula, count(*) AS NrEntregas FROM encomenda
    GROUP BY encomenda.Veículo_Matrícula
    ORDER BY 2 DESC
    LIMIT 2;
END $$



DELIMITER $$
CREATE PROCEDURE `top3clientes`()
BEGIN
	SELECT cliente.NIF, cliente.Nome, count(encomenda.Cliente_NIF) as 'Encomendas Feita' from cliente
    INNER join encomenda ON cliente.NIF = encomenda.Cliente_NIF
    GROUP BY cliente.NIF
    ORDER BY 3 DESC
    LIMIT 3;
END $$

#ver os livros numa encomenda

DELIMITER $$
CREATE PROCEDURE livrosNumaEncomenda (IN encomenda INT)
BEGIN
	SELECT encomenda_has_livros.Encomenda_idEncomenda,
    encomenda_has_livros.Livros_Nome, encomenda_has_livros.Quantidade
    FROM encomenda_has_livros
    WHERE Encomenda = encomenda_has_livros.Encomenda_idEncomenda;
END $$

# procurar em que data foram fornecedios
DELIMITER $$
CREATE PROCEDURE dataFornecidos (IN `Data` DATE)
BEGIN
	SELECT fornecimento_has_livros.Livros_Nome, fornecimento_has_livros.`Data` FROM fornecimento_has_livros
    WHERE `Data`= fornecimento_has_livros.`Data`;
END $$



#id do funcionario e uma data e procura nesse dia que carro e que utilizaram na encomenda
DELIMITER $$
Create procedure verCarroFuncionarioNumaData (IN id INT, IN `Data` DATE)
BEGIN
	SELECT encomenda.Funcionário_idFuncionário as idFuncionário, veículo.Marca as Marca, veículo.Modelo as Modelo, encomenda.`Data de Entrega` as `Data` from encomenda
	inner join veículo
	on encomenda.Veículo_Matrícula = veículo.Matrícula
	WHERE `Data`= encomenda.`Data de Entrega`
    AND id = encomenda.Funcionário_idFuncionário;
    
END $$



#VER O LIVRO MAIS VENDIDO
use livraria
DELIMITER $$
CREATE PROCEDURE livroMaisVendido()
BEGIN 
	SELECT livros.Nome, sum(encomenda_has_livros.Quantidade) as Quantidade from Livros
    INNER JOIN encomenda_has_livros ON encomenda_has_livros.Livros_Nome = Livros.Nome
    GROUP by livros.Nome
    ORDER by 2 DESC
    LIMIT 1;
END $$

select*from encomenda_has_livros;


call livroMaisVendido();
call dataFornecidos('2022-07-10');

#procorar livro por autor
call nomedolivro('J. K. Rowling');
#informacao do livro
call infLivro('Chainsaw Man');
call livrosNumaEncomenda(1);
call top3clientes();
call veiculosMaisUtilizados();
call entregasDosFuncionarios('2022/10/23');
call encomendasEntreguesPorFuncionario(1,'2022-10-21','2022-10-22');
call encomendasDeCLiente('254876589');
call visualizarClientes();
call visualizarEncomendas();
call visualizarRelaçãoEncLivro();
call visualizarFuncionário();
call visualizarLivros();
call visualizarVeículo();
call visualizarFornecedor();
call visualizarFornecimentoHasLivros();
call verCarroFuncionarioNumaData(2,'2022-10-23')
call nomedolivro('J. K. Rowling');
call infLivro('Chainsaw Man');
use livraria



