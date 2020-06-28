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
VALUES ("Sweet Home Alabama", 0, "Movie", 5.88, 150),
  ("Under The Tuscan Sun", 0, "Movie", 15.99, 200),
  ("While You Were Sleeping", 0, "Movie", 5.50, 50),
  ("Can't Buy Me Love", 0, "Movie", 5.78, 25),
  ("The Wedding Planner", 0, "Movie", 5.99, 35),
  ("Holiday", 0, "Movie", 21.49, 42),
  ("Pretty Woman", 0, "Movie", 13.99, 25),
  ("You've Got Mail", 0, "Movie", 12.49, 57),
  ("Kate & Leopold", 0, "Movie", 12.99, 35),
  ("Shortcake", 0, "Book", 3.99, 23),
  ("The Happy Ever After Playlist", 0, "Book", 13.99, 23),
  ("The Friend Zone", 0, "Book", 12.31, 33),
  ("Crazy Rich Asians", 0, "Book", 8.95, 43),
  ("The Princess Bride", 0, "Book", 5.95, 57),
  ("The Sims 4", 0, "Games", 44.99, 63),  
  ("Disney Tangled", 0, "Games", 21.95, 12),  
  ("To The Moon", 0, "Games", 15.95, 22),  
  ("The Pandora Directive", 0, "Games", 14.95, 11),  
  ("500 Days of Summer soundtrack", 0, "Music", 14.95, 11),  
  ("Crazy Stupid Love soundtrack", 0, "Music", 13.95, 21),  
  ("The Devil Wears Prada soundtrack", 0, "Music", 12.95, 30),  
  ("Pretty In Pink soundtrack", 0, "Music", 11.95, 44),  
  ("", 0, "Music", 14.95, 11);

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

