CREATE TABLE user_mst(
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE user_dtl(
  user_dtl_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  name VARCHAR(10) NOT NULL,
  introduce TEXT,
  image_url TEXT,
  join_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_post(
  user_post_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  post_id INT NOT NULL
);

CREATE TABLE user_fav(
  user_fav_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  post_id INT NOT NULL
);

CREATE TABLE user_sub(
  user_sub_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  sub_user INT NOT NULL
);

CREATE TABLE user_pic(
  user_pic_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  post_id INT NOT NULL,
  pic_data TEXT NOT NULL
);

SELECT 
  ud.user_id,
  ud.name,
  ud.introduce,
  ud.image_url,
  COUNT(DISTINCT up.user_post_id) AS post_count,
  COUNT(DISTINCT upc.user_pic_id) AS pic_count,
  COUNT(DISTINCT us.user_sub_id) AS followee_count,
  COUNT(DISTINCT tus.user_sub_id) AS follower_count
FROM user_dtl ud
LEFT JOIN user_post up ON up.user_id = ud.user_id
LEFT JOIN user_pic upc ON upc.user_id = ud.user_id
LEFT JOIN user_sub us ON us.user_id = ud.user_id
LEFT JOIN user_sub tus ON tus.sub_user = ud.user_id
GROUP BY
  ud.user_id,
  ud.name,
  ud.introduce,
  ud.image_url;