# tentar exportar data com relaçoes
use livraria;
#migrar a tabela FORNECEDOR(no modelo mongodb a relacao ja esta dentro do fornecedor, neste caso fornecedor_has_livros esta dentro do fornecedor)
SELECT JSON_ARRAYAGG(JSON_OBJECT('Nome', Nome, 'Livros', (SELECT JSON_ARRAYAGG(JSON_OBJECT('id', LF.id,'Nome', L.Nome, 'Quantidade', LF.Quantidade, 'Data', LF.Data)) FROM fornecedor as F
	INNER JOIN fornecimento_has_livros as LF ON fornecedor.idFornecedor = LF.Fornecedor_idFornecedor
	INNER JOIN livros AS L ON LF.Livros_Nome = L.Nome WHERE F.idFornecedor = LF.Fornecedor_idFornecedor))) FROM fornecedor INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Fornecedor.json';
    
    
#migrar a tabela ENCOMENDA ( relacao livros_has_encomendas esta dentro da encomenda)

SELECT JSON_ARRAYAGG(JSON_OBJECT('Local de Entrega', `Local de Entrega`, 'Estado', Estado, 'Tipo de Pagamento', `Tipo de Pagamento`, 'Data de Encomenda', `Data de Encomenda`,'Data de Entrega', `Data de Entrega`, 'Funcionário', Funcionário_idFuncionário, 'Cliente', Cliente_NIF, 'Veículo', Veículo_Matrícula, 'Livros', (SELECT JSON_ARRAYAGG(JSON_OBJECT('Nome', L.Nome, 'Quantidade', EL.Quantidade)) FROM encomenda AS E
	INNER JOIN encomenda_has_livros as EL ON encomenda.idEncomenda = EL.Encomenda_idEncomenda
    INNER JOIN livros AS L ON EL.Livros_Nome = L.Nome WHERE E.idEncomenda = EL.Encomenda_idEncomenda))) FROM encomenda INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Encomenda.json';

#migrar tabela CLIENTE

SELECT JSON_ARRAYAGG(JSON_OBJECT('NIF', NIF, 'Contacto', Contacto, 'Nome', Nome, 'Código de Postal', `Código de Postal`, 'Localidade', Localidade, 'Rua', Rua)) FROM cliente as C INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Cliente.json';

#migrar tabela LIVROS

SELECT JSON_ARRAYAGG(JSON_OBJECT('Nome', Nome, 'Tema', Tema, 'Autor', Autor, 'Preço', PreçoL, 'Quantidade', Quantidade)) FROM livros as L INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Livros.json';
	
#migrar tabela VEÍCULO

SELECT JSON_ARRAYAGG(JSON_OBJECT('Matrícula', Matrícula, 'Marca', Marca, 'Modelo', Modelo)) FROM veículo as V INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Veículo.json';
	
#migrar tabela FUNCIONÁRIO

SELECT JSON_ARRAYAGG(JSON_OBJECT('id', idFuncionário, 'Nome', Nome, 'Contacto', Contacto)) FROM Funcionário as F INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Funcionário.json';
	