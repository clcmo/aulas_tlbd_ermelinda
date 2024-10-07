-- START TRANSACTION SIGNIFICA QUE FAREMOS UMA TRANSAÇÃO EXPLICITA,
-- UTILIZANDO VARIAS FUNCIONALIDADES DO CRUD
START TRANSACTION
    INSERT INTO produtos (CODIGO, NOME, PRECO) 
        VALUES ('10', 'Suco de Laranja', 4.56);
    DELETE FROM produtos 
        WHERE CODIGO= 5;
-- PARA EM CASOS DE EXITO, UTILIZO O COMMIT PARA FAZER DUAS OU MAIS OPERAÇÕES 
COMMIT; 
-- DO CONTRÁRIO, PARA DEMONSTRAR ERROS, POR EXEMPLO, UTILIZAMOS O ROLLBACK
ROLLBACK;