DELIMITER $$
CREATE PROCEDURE signUpUser(
  IN p_username VARCHAR(50),
  IN p_password VARCHAR(255),
  IN p_name VARCHAR(30),
  IN p_introduce TEXT,
  IN p_image_url TEXT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'Error occurred. Changes have been rolled back.' AS message;
  END;
  
  START TRANSACTION;
  
  INSERT INTO user_mst (username, password)
  VALUES (p_username, p_password);
  
  SET @last_user_id = LAST_INSERT_ID();
  
  INSERT INTO user_dtl (user_id, name, introduce, image_url)
  VALUES (@last_user_id, p_name, p_introduce, p_image_url);
  
  COMMIT;

  SELECT task_id;
END $$
DELIMITER ;