#trigger
use livraria;
# adicionar ao stock de livros sem que e fornecido
DELIMITER $$
CREATE TRIGGER addStock 
	AFTER INSERT ON fornecimento_has_livros
	FOR EACH ROW 
BEGIN
	
	UPDATE livros
		SET livros.Quantidade = livros.Quantidade + NEW.Quantidade
		WHERE livros.Nome = NEW.Livros_Nome;
	
	
END $$
            

drop trigger addStock;
# sempre que é inserida uma encomenda tirar do stock de livros


DELIMITER $$
CREATE TRIGGER takeStock
	AFTER INSERT ON encomenda_has_livros
    FOR EACH ROW
BEGIN
	UPDATE livros
		
			SET livros.Quantidade = livros.Quantidade - NEW.Quantidade
		
		WHERE livros.Nome = NEW.Livros_Nome;
		
			
        
END $$
# TESTAR O TRIGGER takeStock

select * from livros;







