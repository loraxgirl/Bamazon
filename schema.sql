CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products(
  item_id INT AUTO_INCREMENT NOT NULL,
  product_name VARCHAR(45) NOT NULL,
  product_sales DECIMAL(10,2) NOT NULL,
  department_name VARCHAR(45) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock_quantity INT(10) NOT NULL,
  primary key(item_id)
);

select * from products;

INSERT INTO products (product_name, product_sales, department_name, price, stock_quantity)
VALUES ("The Cabinet of Dr. Caligari", 0, "Movie", 5.88, 150),
  ("Nosferatu", 0, "Movie", 15.99, 200),
  ("Psycho", 0, "Movie", 5.50, 50),
  ("Night of the Living Dead", 0, "Movie", 5.78, 25),
  ("Aliens", 0, "Movie", 5.99, 35),
  ("Silence of the Lambs", 0, "Movie", 21.49, 42),
  ("Rosemary's Baby", 0, "Movie", 13.99, 25),
  ("Halloween", 0, "Movie", 12.49, 57),
  ("The Cabin in the Woods", 0, "Movie", 12.99, 35),
  ("The Birds", 0, "Movie", 12.99, 46),

  ("Terrifying Tales by Edgar Allan Poe", 0, "Book", 13.99, 23),
  ("The Haunting of Hill House by Shirley Jackson", 0, "Book", 13.99, 62),
  ("The Lord of the Flies by William Golding", 0, "Book", 12.31, 33),
  ("Ring by Kōji Suzuki", 0, "Book", 8.95, 43),
  ("Pet Sematary by Stephen King", 0, "Book", 5.95, 57),
  ("Blood Meridian by Cormac McCarthy", 0, "Book", 15.79, 31),
  ("Exquisite Corpse by Poppy Z. Brite", 0, "Book", 8.30, 14),

  ("Resident Evil 7", 0, "Games", 44.99, 63),  
  ("Layers of Fear", 0, "Games", 21.95, 12),  
  ("Alien: Isolation", 0, "Games", 11.99, 22),  
  ("P.T.", 0, "Games", 14.95, 11),  
  ("Silent Hill 2", 0, "Games", 29.99, 33),  

  ("Xtro soundtrack", 0, "Music", 14.95, 11),  
  ("Zombi 2 soundtrack", 0, "Music", 13.95, 21),  
  ("Events Score - Daniel Davies", 0, "Music", 12.95, 30),  
  ("Forbidden Fruit - Kronos Quartet", 0, "Music", 11.95, 44),  
  ("Serenada Schizophrana", 0, "Music", 24.95, 51);

  CREATE TABLE departments(
  department_id INT AUTO_INCREMENT NOT NULL,
  department_name VARCHAR(45) NOT NULL,
  over_head_costs DECIMAL(10,2) NOT NULL,
  total_sales DECIMAL(15,2) NOT NULL,
  primary key(department_id)
);

select * from departments;

INSERT INTO departments (department_name, over_head_costs, total_sales)
VALUES ("Movie", 200, 300),
  ("Book", 100, 200),
  ("Games", 50, 90),
  ("Music", 300, 100);

