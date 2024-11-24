
use restaurante;

create table tb_clientes (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(45) NOT NULL,
	sobrenome_cliente VARCHAR(45),
    endereco_email_cliente VARCHAR(50),
    numero_telefone_cliente VARCHAR(11)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table tb_reserva (
	id_reserva INT AUTO_INCREMENT PRIMARY KEY,	
    fk_id_cliente INT NOT NULL,  
	numero_pessoas_reserva INT NOT NULL,
    data_hora_reserva DATETIME NOT NULL,
    status_reserva VARCHAR(10) NOT NULL,
	CONSTRAINT fk_id_cliente FOREIGN KEY (fk_id_cliente) REFERENCES tb_clientes(id_cliente)
)ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table tb_mesa (
	id_mesa INT AUTO_INCREMENT PRIMARY KEY,
    status_pagamento_mesa VARCHAR(45) NOT NULL,
    fk_id_reserva INT NOT NULL,
	CONSTRAINT fk_id_reserva FOREIGN KEY (fk_id_reserva) REFERENCES tb_reserva(id_reserva)
)ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table tb_pedido (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    status_pedidos VARCHAR(20) NOT NULL,
    fk_id_mesa INT NOT NULL,
    CONSTRAINT fk_id_mesa FOREIGN KEY (fk_id_mesa) REFERENCES tb_mesa(id_mesa)
)ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table tb_prato (
	id_prato INT AUTO_INCREMENT PRIMARY KEY,
    nome_prato VARCHAR(45) NOT NULL,
    descricao_prato VARCHAR(45) NOT NULL,
    preco_prato DECIMAL NOT NULL,
    categoria_prato VARCHAR(45)
)ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

create table tb_quantidade_pedido (
	fk_id_prato INT NOT NULL,
    fk_id_pedido INT NOT NULL,
    quantidade_pedido INT NOT NULL,
    PRIMARY KEY(fk_id_prato, fk_id_pedido),
	CONSTRAINT fk_id_prato FOREIGN KEY (fk_id_prato) REFERENCES tb_prato(id_prato),
	CONSTRAINT fk_id_pedido FOREIGN KEY (fk_id_pedido) REFERENCES tb_pedido(id_pedido)
)ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;








