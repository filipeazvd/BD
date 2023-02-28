#Vistas


#Tabela informacao com a media relativa aos livros

CREATE VIEW vw_mediaPreço AS
	SELECT AVG(livros.PreçoL) AS MediaPreço, AVG(livros.Quantidade) AS MediaQuantidade FROM livros;
    
SELECT * FROM vw_mediaPreço

#Tabela com o preço das encomendas

CREATE VIEW vw_preço AS
	SELECT encomenda_has_livros.Encomenda_idEncomenda as id, ROUND(SUM((encomenda_has_livros.Quantidade * livros.PreçoL))) as Preço from encomenda_has_livros
	inner join livros on encomenda_has_livros.Livros_Nome = livros.Nome
    GROUP BY 1
    ORDER BY 1;
    
	
SELECT * FROM vw_preço;

#VISTA COM TODAS AS INFORMAÇOES DE UMA ENCOMENDA


CREATE VIEW vw_encomenda AS
SELECT encomenda.idEncomenda, funcionário.Nome as 'funcionário', veículo.Modelo, cliente.Nome as 'cliente', '-' as 'livro' from encomenda
	INNER JOIN funcionário on encomenda.Funcionário_idFuncionário = funcionário.idFuncionário
    INNER JOIN veículo on encomenda.Veículo_Matrícula = veículo.Matrícula
    INNER JOIN cliente on encomenda.Cliente_NIF = cliente.NIF
    INNER JOIN encomenda_has_livros  ON encomenda.idEncomenda = encomenda_has_livros.Encomenda_idEncomenda
    INNER JOIN livros on encomenda_has_livros.Livros_Nome = livros.Nome
UNION
	SELECT encomenda_has_livros.Encomenda_idEncomenda,'-','-','-', livros.Nome As 'livro' from encomenda_has_livros
    INNER JOIN livros on encomenda_has_livros.Livros_Nome = livros.Nome
    ORDER by 1;
    






