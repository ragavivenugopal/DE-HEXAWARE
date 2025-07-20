-- Create table burger_runner
CREATE TABLE burger_runner(
   runner_id INT NOT NULL PRIMARY KEY,
   registration_date date NOT NULL
);


-- Insert values into burger_runner
INSERT INTO burger_runner VALUES
(1, '2021-01-01'),
(2, '2021-01-03'),
(3, '2021-01-08'),
(4, '2021-01-15');

SELECT * FROM burger_runner;