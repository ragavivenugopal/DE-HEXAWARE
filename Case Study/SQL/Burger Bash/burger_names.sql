-- Create table burger_names
CREATE TABLE burger_names(
   burger_id INT NOT NULL PRIMARY KEY,
   burger_name VARCHAR(10) NOT NULL
);

-- Insert values into burger_names
INSERT INTO burger_names VALUES 
(1,'Meatlovers'),
(2,'Vegetarian');

SELECT * FROM burger_names;