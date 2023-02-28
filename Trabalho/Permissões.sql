#permissões de controlo
use livraria;

CREATE USER 'SrAlberto'@'localhost' IDENTIFIED BY 'livrariasilva';
CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'funcionariosilva';

GRANT ALL PRIVILEGES ON livraria.* TO 'SrAlberto'@'localhost';


GRANT UPDATE (`Estado`) on livraria.encomenda TO 'funcionario'@'localhost';

GRANT EXECUTE ON PROCEDURE visualizarEncomendas TO 'funcionario'@'localhost';

GRANT SELECT (Contacto) ON livraria.cliente TO 'funcionario'@'localhost';
GRANT SELECT (Nome) ON livraria.cliente TO 'funcionario'@'localhost';
GRANT SELECT (NIF) ON livraria.cliente TO 'funcionario'@'localhost';
GRANT SELECT (`Código de Postal`) ON livraria.cliente TO 'funcionario'@'localhost';
GRANT SELECT ON livraria.cliente TO 'funcionario'@'localhost';
flush privileges;

show grants for 'SrAlberto'@'localhost'
show grants for 'funcionario'@'localhost'
/*
SELECT * FROM mysql.user;
SELECT * FROM encomenda;
GRANT ALL PRIVILEGES ON livraria.* TO 'SrAlberto'@'localhost';
*/