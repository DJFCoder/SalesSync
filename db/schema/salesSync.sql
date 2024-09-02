-- -----------------------------------------------------
-- salesSync DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS salesSync_db DEFAULT CHARACTER SET utf8;
USE salesSync_db;

-- -----------------------------------------------------
-- Categoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS categoria (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(90) NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Produto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS produto (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(90) NOT NULL,
  codigo VARCHAR(45) NOT NULL,
  quantidade INT NOT NULL,
  preco_unitario DECIMAL(9,2) NOT NULL,
  categoria_id INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX fk_produto_categoria_idx (categoria_id),
  CONSTRAINT fk_produto_categoria
    FOREIGN KEY (categoria_id)
    REFERENCES categoria (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuario (
  id INT NOT NULL AUTO_INCREMENT,
  login VARCHAR(90) NOT NULL,
  senha VARCHAR(120) NOT NULL,
  ultimo_login DATETIME NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Cargo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cargo (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(90) NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Perfil
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS perfil (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(90) NOT NULL,
  email VARCHAR(128) NULL,
  cpf VARCHAR(11) NOT NULL,
  usuario_id INT NOT NULL,
  cargo_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_perfil_usuario_idx (usuario_id),
  INDEX fk_perfil_cargo_idx (cargo_id),
  CONSTRAINT fk_perfil_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES `usuario` (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_perfil_cargo
    FOREIGN KEY (cargo_id)
    REFERENCES cargo (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cliente (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(90) NULL,
  email VARCHAR(128) NULL,
	cpf VARCHAR(11) NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Venda
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS venda (
  id INT NOT NULL AUTO_INCREMENT,
  cod_venda VARCHAR(25) NOT NULL,
  data DATETIME NOT NULL,
	status VARCHAR(25) NOT NULL,
  perfil_id INT NOT NULL,
  cliente_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_venda_perfil_idx (perfil_id),
  INDEX fk_venda_cliente_idx (cliente_id),
  CONSTRAINT fk_venda_perfil
    FOREIGN KEY (perfil_id)
    REFERENCES perfil (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_venda_cliente
    FOREIGN KEY (cliente_id)
    REFERENCES cliente (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Item Venda
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS item_venda (
  id INT NOT NULL AUTO_INCREMENT,
  quantidade INT NOT NULL,
  subtotal DECIMAL(9,2) NOT NULL,
  venda_id INT NOT NULL,
  produto_id INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX fk_item_venda_venda_idx (venda_id),
  INDEX fk_item_venda_produto_idx (produto_id),
  CONSTRAINT fk_iv_venda
    FOREIGN KEY (venda_id)
    REFERENCES venda (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_iv_produto
    FOREIGN KEY (produto_id)
    REFERENCES produto (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Backup
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS backup (
  id INT NOT NULL AUTO_INCREMENT,
  data_hora DATETIME NOT NULL,
  status VARCHAR(25) NOT NULL,
  perfil_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_backup_perfil_idx (perfil_id),
  CONSTRAINT fk_backup_perfil
    FOREIGN KEY (perfil_id)
    REFERENCES perfil (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Log
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS log (
  id INT NOT NULL AUTO_INCREMENT,
  data_hora DATETIME NOT NULL,
  acao VARCHAR(255) NOT NULL,
  perfil_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_log_perfil_idx (perfil_id),
  CONSTRAINT fk_log_perfil
    FOREIGN KEY (perfil_id)
    REFERENCES perfil (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Telefone
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS telefone (
	id INT NOT NULL AUTO_INCREMENT,
	cod_pais VARCHAR(3) NOT NULL,
	ddd VARCHAR(3) NOT NULL,
	numero VARCHAR(20) NOT NULL,
	num_pertence ENUM('P', 'C') NOT NULL, -- Perfil ou Cliente
	perfil_id INT NULL,
	cliente_id INT NULL,
	PRIMARY KEY (id),
	INDEX fk_telefone_perfil_idx (perfil_id),
	INDEX fk_telefone_cliente_idx (cliente_id),
	CONSTRAINT fk_telefone_perfil
	FOREIGN KEY (perfil_id) REFERENCES perfil (id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	CONSTRAINT fk_telefone_cliente
		FOREIGN KEY (cliente_id) REFERENCES cliente (id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT chk_telefone_tipo CHECK (
		(perfil_id IS NOT NULL AND cliente_id IS NULL AND num_pertence = 'P') OR
		(perfil_id IS NULL AND cliente_id IS NOT NULL AND num_pertence = 'C')
	)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Endereco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS endereco (
  id INT NOT NULL AUTO_INCREMENT,
  logradouro VARCHAR(255) NOT NULL,
  numero VARCHAR(10) NULL,
  complemento VARCHAR(100) NULL,
  bairro VARCHAR(100) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  uf CHAR(2) NOT NULL,
  cep VARCHAR(10) NOT NULL,
  end_pertence ENUM('P', 'C') NOT NULL, -- Perfil ou Cliente
  perfil_id INT NULL,
  cliente_id INT NULL,
  PRIMARY KEY (id),
		INDEX fk_endereco_perfil_idx (perfil_id),
		INDEX fk_endereco_cliente_idx (cliente_id),
  CONSTRAINT fk_endereco_perfil
    FOREIGN KEY (perfil_id) REFERENCES perfil (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_endereco_cliente
    FOREIGN KEY (cliente_id) REFERENCES cliente (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT chk_endereco_tipo CHECK (
    (perfil_id IS NOT NULL AND cliente_id IS NULL AND end_pertence = 'P') OR
    (perfil_id IS NULL AND cliente_id IS NOT NULL AND end_pertence = 'C')
  )
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Pagamento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pagamento (
  id INT NOT NULL AUTO_INCREMENT,
  tipo_pg ENUM('E', 'D', 'C') NOT NULL,
  numero_cartao VARCHAR(45) NULL,
  qnt_parcelas INT NULL,
  data_pg DATETIME NOT NULL,
  venda_id INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX fk_pagamento_venda_idx (venda_id),
  CONSTRAINT fk_pagamento_venda
    FOREIGN KEY (venda_id)
    REFERENCES venda (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;
