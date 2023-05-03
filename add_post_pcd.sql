DELIMITER $$
CREATE PROCEDURE addPost(
    IN p_user_id INT,
    IN p_post_cnt TEXT,
    IN p_store_id INT,
    IN p_eval_ids TEXT,
    IN p_pic_datas TEXT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error occurred. Changes have been rolled back.' AS message;
    END;

    START TRANSACTION;
    INSERT INTO post_mst (user_id, post_cnt, store_id)
    VALUES (p_user_id, p_post_cnt, p_store_id);
    
    SET @post_id = LAST_INSERT_ID();
    
    SET @evals = p_eval_ids;
    WHILE LENGTH(@evals) > 0 DO
        SET @eval_id = SUBSTRING_INDEX(@evals, ',', 1);
        INSERT INTO post_eval (post_id, store_id, eval_id)
        VALUES (@post_id, p_store_id, @eval_id);
        SET @evals = SUBSTRING(@evals, LENGTH(@eval_id) + 2);
    END WHILE;
    
    SET @pic_datas = p_pic_datas;
    WHILE LENGTH(@pic_datas) > 0 DO
        SET @pic_data = SUBSTRING_INDEX(@pic_datas, ',', 1);
        INSERT INTO post_pic (post_id, user_id, pic_data)
        VALUES (@post_id, p_user_id, @pic_data);
        SET @pic_datas = SUBSTRING(@pic_datas, LENGTH(@pic_data) + 2);
    END WHILE;
    
    COMMIT;
END $$
DELIMITER ;