sp_help employee;/*displaying the structure of the table*/

create database employeedb;
use employeedb;

-- creatig table
create table employee(
employee_id int identity(1,1)  primary key,
employee_name varchar(20) not null,
department varchar(50),
salary decimal(10,2),
gender char(1) -- M or F
);

drop table if exists employee;

-- inserting values into it
insert into employee(employee_name,department,salary,gender) values
('Ragavi', 'HR', 35000.00, 'F'),
('Ram', 'IT', 50000.00, 'M'),
('Anitha', 'Finance', 42000.00, 'F'),
('Som', 'Sales', 38000.00, 'M'),
('Nikitha', 'Marketing', 40000.00, 'F'),
('Prakash', 'Operations', 45000.00, 'M');

select * from employee;

create table course (
course_id int primary key identity(1,1),
course_name varchar(100) not null,
employee_id int references employee(employee_id)
);

drop table if exists course;

insert into course(course_name,employee_id) values
('Time Management', 1),
('Advanced Python', 2),
('Corporate Finance', 3),
('Sales Strategy', 4),
('Digital Marketing', 5),
('Logistics Essentials', 6);

select * from course;

--  ----------------


/*Rankig Functions*/
/* row()_number-giving consecutive numbers to rank*/
select * from employee;
select employee_id,employee_name,salary,ROW_NUMBER() over(order by salary desc) as rownumber
from employee;

/*rank()-used to give rank if duplicates allowed ranking will be changed based on duplicates  */
select employee_id,employee_name,salary,rank() over(order by salary desc) as rank
from employee;

/*dense_rank()-used to give ranks consecutively even if duplicates are allowed*/
select employee_id,employee_name,salary,dense_rank() over(order by salary desc) as rank
from employee;

/*ntile() function- it will divide give the rank in groups*/
/*without condition*/
select employee_id,employee_name,salary,ntile(2) over(order by salary) as rank
from employee;

/*with condition*/
select employee_name,salary,ntile(3) over(order by salary) as rank
from employee where salary>40000;

/*System functions*/
select host_name() as Host_name;/*return system hostname*/
select Host_ID();/*return host id*/
select SUSER_ID();
select USER_ID();
select DB_NAME();/*return database name*/

/*Aggregate funtions*/
select count(*) as total_records from employee;

select count(*) as higher_salary from employee where salary>30000;

select department,min(salary) min_salary from employee
group by department;

select department,max(salary) max_salary from employee
group by department;

select department,sum(salary) total_salary from employee
group by department;

select department,avg(salary) avg_salary from employee
group by department;


-- --------------------------

/* String functions*/
select ascii('CB'); /*return leftmost ascii value*/
select char(66); /*return ascii value to character*/
select len('Ragavi Venugopal');/*return length*/
select lower('RAGAVI');/*convert to lowercase*/
select replace('Microsoft sql','sql','server');/*replace*/
select reverse('python');/*reverse the string */
select upper('ragavi');/*converts to upper*/
select str(136.564,8,4);/*STR(number, length, decimals)*/

/* Date Functions*/
select  getdate ();/*get current date and time*/
select dateadd (mm, 2, '2023-12-07');/*add months to existed date */
select datediff ( year, convert (datetime, '2006-05-06'), convert ( datetime, '2009-01-01'));/*it will return the difference of date,months,years also*/
select datepart (mm, '2008-5-22');/*return months value*/
select day ( '2023-05-30');/*return value of date of that particular day*/
select month ('2023-05-31');/*return month value*/
select year ( '2023-05-3');/*return year value*/

/*Mathematical Functions*/
select abs(-101);/*returns absolute value*/
select sin(1.5);/*returns angle in radians*/
select ceiling(14.01);/*returns the smallest or greater to the specified value*/
select exp(4.5);/*returns the exponencial value*/
select floor(14.75);
select log(5.4);/*return logarithmic value*/


-- ----------
-- Employees whose salary is above the average salary
select * from employee
where salary > (select avg(salary) from employee);

-- List of employees who have enrolled in any course
select * from employee
where employee_id in (select employee_id from course);

-- List employees whose salary is greater than the average salary of their own department
select * from employee e1
where salary > (
    select avg(salary)
    from employee e2
    where e2.department = e1.department
);

