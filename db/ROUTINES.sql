-- Criação de usuários de banco de dados:
CREATE USER 'dono'@'salesSync_db' IDENTIFIED BY '1234';
CREATE USER 'admin'@'salesSync_db' IDENTIFIED BY '1234';
CREATE USER 'vendedor'@'salesSync_db' IDENTIFIED BY '1234';
CREATE USER 'logistica'@'salesSync_db' IDENTIFIED BY '1234';

-- Concessão de permissões:
GRANT ALL PRIVILEGES ON salesSync_db.* TO 'dono'@'salesSync_db';
GRANT SELECT, INSERT, UPDATE, DELETE ON salesSync_db.* TO 'admin'@'salesSync_db';
GRANT SELECT, INSERT, 
UPDATE ON 
	salesSync_db.venda, salesSync_db.cliente, salesSync_db.item_venda TO 'vendedor'@'salesSync_db';
GRANT SELECT, UPDATE ON salesSync_db.produto TO 'logistica'@'salesSync_db';

-- TRIGGER para inserção de senha encriptada em MD5:
DELIMITER //

CREATE TRIGGER trg_encrypt_password_bfr_ins
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN

  SET NEW.senha = MD5(NEW.senha);

END//

DELIMITER ;

-- VIEW para produtos em estoque:

CREATE VIEW vw_produtos_estoque AS
SELECT p.nome AS produto, p.codigo, p.quantidade, p.preco_unitario, c.nome AS categoria
FROM produto p
JOIN categoria c ON p.categoria_id = c.id;


-- VIEW para vendas realizadas:

CREATE VIEW vw_vendas_realizadas AS
SELECT v.cod_venda, v.data, v.status, p.nome AS nome_perfil, c.nome AS nome_cliente
FROM venda v
JOIN perfil p ON v.perfil_id = p.id
JOIN cliente c ON v.cliente_id = c.id;


-- TRIGGER para atualizar estoque após venda:

DELIMITER //
CREATE TRIGGER trg_update_estoque AFTER INSERT ON item_venda
FOR EACH ROW
BEGIN

  UPDATE produto 
  SET quantidade = quantidade - NEW.quantidade
  WHERE id = NEW.produto_id;

END//
DELIMITER ;


-- INDEX composto na tabela produto:
CREATE INDEX idx_produto_categoria_nome ON produto (categoria_id, nome);
