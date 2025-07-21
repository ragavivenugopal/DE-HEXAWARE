-- 1. DATABASE & TABLE CREATION
create database librarydb;
GO
use librarydb;
GO

-- Authors table
create table authors (
    author_id int primary key identity(1,1),
    name varchar(100) not null,
    country varchar(50)
);
GO

-- Books table
create table books (
    book_id int primary key identity(1,1),
    title varchar(150) not null,
    genre varchar(50),
    price decimal(6,2),
    author_id int foreign key references authors(author_id),
    published_year int
);
GO

-- Members table
create table members (
    member_id int primary key identity(1,1),
    name varchar(100) not null,
    email varchar(100) unique,
    join_date date
);
GO

-- Borrows table
create table borrows (
    borrow_id int primary key identity(1,1),
    borrow_date date,
    return_date date,
    book_id int foreign key references books(book_id),
    member_id int foreign key references members(member_id)
);
GO

-- Drop tables if they exist (in correct order to avoid FK constraint errors)
if object_id('borrows', 'U') is not null drop table borrows;
if object_id('books', 'U') is not null drop table books;
if object_id('authors', 'U') is not null drop table authors;
if object_id('members', 'U') is not null drop table members;
GO

-- Insert sample data
insert into authors (name,country) values 
('J.K. Rowling','United Kingdom'),
('George R.R. Martin','United States'),
('Haruki Murakami','Japan');
GO

insert into books (title,author_id,published_year,genre,price) values 
('Harry Potter and the Sorcerers Stone',1,1997,'Fantasy',19.99),
('Harry Potter and the Chamber of Secrets',1,1998,'Fantasy',20.99),
('A Game of Thrones',2,1996,'Fantasy',25.99),
('Kafka on the Shore',3,2002,'Fiction',18.50);
GO

insert into members (name,email,join_date) values 
('Alice Johnson','alice@example.com','2024-01-15'),
('Bob Smith','bob@example.com','2024-02-10'),
('Charlie Brown','charlie@example.com','2024-03-05');
GO

insert into borrows (book_id,member_id,borrow_date,return_date) values 
(1,1,'2024-04-01','2024-04-15'),
(3,2,'2024-04-10','2024-04-24'),
(4,3,'2024-04-12',NULL);
GO

-- UPDATE
update members set name = 'alice j.' where member_id = 1;
GO

-- DELETE
delete from borrows where borrow_id = 3;
GO

-- ALTER TABLE
alter table members add phone varchar(15);
alter table books add stock int default 10;
GO

-- DROP COLUMN
alter table members drop column phone;
GO

-- TRUNCATE
truncate table borrows;
GO

-- SELECT BASICS
select * from books;
select name,email from members;
select title,price from books where genre='Fantasy';

-- WHERE CLAUSE
select * from books where price > 20;
select * from authors where country = 'Japan';

-- ORDER BY
select * from books order by price desc;
select * from members order by join_date asc;

-- DISTINCT
select distinct genre from books;

-- LIMIT → TOP
select top 2 * from books;

-- IN, BETWEEN, LIKE
select * from books where genre in ('Fantasy','Fiction');
select * from books where published_year between 1990 and 2000;
select * from authors where name like '%Martin%';

-- GROUP BY + HAVING
select genre,count(*) as count_books from books group by genre;
select genre,avg(price) from books group by genre having avg(price)>20;

-- JOINS

-- INNER JOIN
select b.title,a.name 
from books b
inner join authors a on b.author_id=a.author_id;

-- LEFT JOIN
select m.name, br.book_id 
from members m
left join borrows br on m.member_id=br.member_id;

-- RIGHT JOIN
select m.name, br.book_id 
from borrows br
right join members m on br.member_id=m.member_id;

-- FULL OUTER JOIN
select m.name, br.book_id 
from members m
full outer join borrows br on m.member_id=br.member_id;

-- CROSS JOIN
select m.name as member_name, b.title as book_title
from members m
cross join books b;

-- EQUI JOIN
select b.title, a.name as author_name
from books b, authors a
where b.author_id = a.author_id;

-- AGGREGATE FUNCTIONS
select count(*) as total_books from books;
select avg(price) as avg_price from books;
select min(published_year), max(published_year) from books;
select sum(price) as total_value from books;

-- DATE FUNCTIONS
select name, year(join_date) as join_year from members;
select datediff(day, borrow_date, return_date) as borrow_duration from borrows;

-- MATH FUNCTIONS
select round(price, 0), floor(price), ceiling(price)
from books;

-- STRING FUNCTIONS
select upper(name), lower(name), len(name)
from members;

-- SUBQUERY
select*from books 
where price>(select avg(price) from books);

-- CORRELATED SUBQUERY
select*from books b1
where price>(
    select avg(price) from books b2 where b2.genre = b1.genre
);

-- UNION
select title from books where genre='Fantasy'
union
select title from books where genre='Fiction';

-- INTERSECT Simulation
select b1.title from books b1
join books b2 on b1.title = b2.title
where b1.genre = 'Fantasy' and b2.price>20;

-- EXCEPT
select title from books
where genre = 'Fantasy'
except
select title from books where genre = 'Fiction';

-- EXISTS
select * from books b
where exists (
  select 1 from authors a where a.author_id = b.author_id
);

-- ANY (use SOME)
select * from books
where price > some (
  select price from books where genre = 'Fiction'
);

-- ALL
select * from books
where price > all (
  select price from books where genre = 'Fiction'
);

-- CASE
select title, 
case 
  when price > 20 then 'expensive'
  else 'affordable'
end as price_category
from books;

-- VIEW
create view fantasy_books as
select title, price from books where genre = 'Fantasy';
GO
