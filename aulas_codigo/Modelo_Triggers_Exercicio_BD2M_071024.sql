-- Criação da tabela de auditoria de pedidos
CREATE TABLE IF NOT EXISTS auditoria_pedidos (
    id_ap INT AUTO_INCREMENT PRIMARY KEY,
    tipo_operacao VARCHAR(10),
    id_pedido INT,
    data_registro DATETIME
);

-- Criação do trigger de auditoria para inserções
DELIMITER //
CREATE TRIGGER auditoria_pedidos_insert 
AFTER INSERT ON pedidos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_pedidos (tipo_operacao, id_pedido, data_registro)
    VALUES ('Inserção', NEW.id_pedido, NOW());
END;
//

-- Criação do trigger de auditoria para atualizações
CREATE TRIGGER auditoria_pedidos_update 
AFTER UPDATE ON pedidos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_pedidos (tipo_operacao, id_pedido, data_registro)
    VALUES ('Atualização', NEW.id_pedido, NOW());
END;
//

-- Criação do trigger de auditoria para exclusões
CREATE TRIGGER auditoria_pedidos_delete 
AFTER DELETE ON pedidos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_pedidos (tipo_operacao, id_pedido, data_registro)
    VALUES ('Exclusão', OLD.id_pedido, NOW());
END;
//
DELIMITER ;