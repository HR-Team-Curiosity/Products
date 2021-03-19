DROP DATABASE IF EXISTS SDC;
CREATE DATABASE SDC;
USE SDC;

CREATE TABLE Product (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  slogan VARCHAR(500) DEFAULT NULL,
  description VARCHAR(1000) DEFAULT NULL,
  category VARCHAR(100) NOT NULL,
  default_price INT NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

drop table if EXISTS styles
CREATE TABLE Styles (
  id INT NOT NULL AUTO_INCREMENT,
  product_id INT NOT NULL,
  name VARCHAR(1000) NOT NULL,
  sale_price VARCHAR(1000) DEFAULT NULL,
  original_price VARCHAR(1000) NOT NULL,
  default_style VARCHAR(1000),
  PRIMARY KEY (id),
  FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Reviews (
  id INT NOT NULL AUTO_INCREMENT,
  product_id INT NOT NULL,
  rating VARCHAR(10) DEFAULT NULL,
  date VARCHAR(100) DEFAULT NULL,
  summary VARCHAR(1000) DEFAULT NULL,
  body VARCHAR(2000) DEFAULT NULL,
  recommended VARCHAR(100) DEFAULT NULL,
  reported VARCHAR(100) DEFAULT NULL,
  reviewer_name VARCHAR(100) DEFAULT NULL,
  reviewer_email VARCHAR(100) DEFAULT NULL,
  response VARCHAR(1000) DEFAULT NULL,
  helpfulness VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Results (
  id INT NOT NULL AUTO_INCREMENT,
  style_id INT NOT NULL,
  size VARCHAR(10) NOT NULL,
  stock INT NOT NULL,
  isDefault TINYINT NOT NULL,
  name VARCHAR(60) NOT NULL,
  original_price INT NOT NULL,
  sale_price INT DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (style_id) REFERENCES Styles(id)
);

CREATE TABLE Features (
  id INT NOT NULL AUTO_INCREMENT,
  product_id INT NOT NULL,
  feature VARCHAR(100) NOT NULL,
  value VARCHAR(100) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Cart (
  id INT NOT NULL AUTO_INCREMENT,
  product_id INT NOT NULL,
  selected_style VARCHAR(100) NOT NULL,
  price INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Related (
  id INT NOT NULL,
  current_product_id VARCHAR(50) NOT NULL,
  related_product_id VARCHAR(50) NOT NULL
);

CREATE TABLE Photos (
  id INT NOT NULL,
  style_id INT NOT NULL,
  url TEXT DEFAULT NULL,
  thumbnail_url TEXT DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Skus (
  id INT NOT NULL,
  style_id INT NOT NULL,
  size VARCHAR(10) DEFAULT NULL,
  quantity INT DEFAULT 0,
  PRIMARY KEY (id)
);
