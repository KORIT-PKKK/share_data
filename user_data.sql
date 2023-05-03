CREATE TABLE user_mst(
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE user_dtl(
  user_dtl_id INT AUTO_INCREMENT PRIMARY KEY,
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