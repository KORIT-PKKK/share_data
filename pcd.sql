DELIMITER $$
CREATE PROCEDURE addEval(
    IN p_eval_cnt TEXT,
    IN p_eval_ctg INT,
    IN p_eval_emoji CHAR(4)
)
BEGIN

	INSERT INTO eval_list(eval_cnt, eval_ctg, eval_imoji)
    VALUES (p_eval_cnt, p_eval_ctg, p_eval_emoji);

END $$
DELIMITER ;