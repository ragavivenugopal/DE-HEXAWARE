create database subqueries;
use subqueries;

create table studentsdetails (name char(15), roll int, loaction char(15));

create table sectiondetails (name char(15), roll int, section char(5));

insert into studentsdetails values
('abhi',580,'Delhi'),
('kiran',581,'assam'),
('aditya',582,'hyderabad'),
('ram',583,'mumbai');

select * from studentsdetails;

insert into sectiondetails values
('abhi',580,'A'),
('ram',583,'A'),
('kiran',581,'B'),
('aditya',582,'C');

select * from sectiondetails;

/* subqueries */ 

/* select */ 
select distinct * from studentsdetails
where roll in ( select roll from sectiondetails where section='A');

select studentsdetails.name,studentsdetails.roll , sectiondetails.section from studentsdetails
join sectiondetails on studentsdetails.roll = sectiondetails.roll
where sectiondetails.section='A';

select name,roll
from studentsdetails
where roll in (select roll from sectiondetails where roll>581);

/* update */ 
update sectiondetails 
set section='A'
where name in ( select name from sectiondetails where name='aditya');

select * from sectiondetails;

select * from studentsdetails;

/* insert */ 
insert into studentsdetails select * from sectiondetails;

begin tran;
select studentsdetails.name,studentsdetails.roll , sectiondetails.section from studentsdetails
join sectiondetails on studentsdetails.roll = sectiondetails.roll
where sectiondetails.section='A';
save tran del5;

rollback tran del5; 

select * from studentsdetails;
select * from sectiondetails;

/* exists */ 
SELECT name,roll
FROM studentsdetails
WHERE EXISTS
(SELECT section FROM sectiondetails WHERE studentsdetails.roll = sectiondetails.roll and section='B');

/* all keyword */

SELECT ALL name,roll
FROMástudentsdetails
WHERE roll > 581;

/* any keyword */

SELECT name
FROM studentsdetails
WHERE roll = ANY (SELECT roll FROM sectiondetails WHERE roll > 581);

create table products 
(
ProdcutID INT, 
ProductName varchar(255), 
SupplieriD INT, 
CategoryID INT
);

Insert into products values 
(1, 'chais', 1, 1),
(2, 'chang', 1, 1),
(3, 'Aniseed syrup',1, 2),
(4, 'Chef Antons Cajun Seasoning',2, 2),
(5, 'Chef Antons Gumbo Mix',2, 2);

select * from products;

create table suppliers 
(
supplierID INT, 
supplierName varchar(255), 
ContactName VARCHAR(255),  
Address varchar(255)
);

Insert into suppliers values 
(1, 'Exotic Liquid','Charlotte Cooper', '49 Gilbert st'),
(2, 'New Orleans Cajun Delights', 'shelley burke', 'P.O.Box 78934'),
(3, 'Grandma Kellys Homestead','Regina Murphy','707 Oxford Rd'),
(4, 'Tokyo Traders','Yoshi Nagase','9-8 Sekimai Musashino-shi');

select * from suppliers;

SELECT SupplierName FROM Suppliers
WHERE EXISTS 
(
SELECT ProductName FROM Products 
WHERE Products.SupplierID = Suppliers.supplierID
);