
-- 1. DDL (Create Tables)

create table authors (
    author_id int auto_increment primary key,
    name varchar(100) not null,
    country varchar(50)
);

create table books (
    book_id int auto_increment primary key,
    title varchar(200) not null,
    author_id int,
    genre varchar(50),
    published_year int check (published_year > 0),
    price decimal(6,2) default 0.00,
    foreign key (author_id) references authors(author_id)
);

create table members (
    member_id int auto_increment primary key,
    name varchar(100) not null,
    email varchar(100) unique,
    join_date date default curdate()
);

create table borrow (
    borrow_id int auto_increment primary key,
    member_id int,
    book_id int,
    borrow_date date,
    return_date date,
    foreign key (member_id) references members(member_id),
    foreign key (book_id) references books(book_id)
);

-- 2. Insert Values

insert into authors (name, country) values
('J.K. Rowling', 'UK'),
('George R.R. Martin', 'USA'),
('Haruki Murakami', 'Japan');

insert into books (title, author_id, genre, published_year, price) values
('Harry Potter', 1, 'Fantasy', 1997, 499.99),
('Game of Thrones', 2, 'Fantasy', 1996, 599.99),
('Kafka on the Shore', 3, 'Fiction', 2002, 399.50);

insert into members (name, email, join_date) values
('Alice', 'alice@example.com', '2023-01-10'),
('Bob', 'bob@example.com', '2023-02-15'),
('Charlie', 'charlie@example.com', '2023-03-20');

insert into borrow (member_id, book_id, borrow_date, return_date) values
(1, 1, '2023-05-01', '2023-05-15'),
(2, 2, '2023-05-10', '2023-05-20'),
(3, 3, '2023-06-01', null);

-- 3. Alter Table

alter table books add column stock int default 10;

-- 4. Update

update books set stock = stock - 1 where book_id = 1;

-- 5. Delete

delete from members where name = 'Charlie';

-- 6. Joins

select m.name, b.title, br.borrow_date
from members m
inner join borrow br on m.member_id = br.member_id
inner join books b on br.book_id = b.book_id;

-- 7. Subqueries

select title from books
where author_id = (
    select author_id from authors where name = 'J.K. Rowling'
);

-- 8. Views

create view recent_borrow as
select m.name as member_name, b.title as book_title, br.borrow_date
from members m
join borrow br on m.member_id = br.member_id
join books b on br.book_id = b.book_id
where br.borrow_date >= '2023-05-01';

-- 9. Indexing

create index idx_author on books(author_id);

-- 10. Transactions

start transaction;
update books set stock = stock - 1 where book_id = 2;
insert into borrow (member_id, book_id, borrow_date, return_date)
values (1, 2, curdate(), null);
commit;

-- 11. Case

select title,
case
    when price > 500 then 'Expensive'
    when price between 300 and 500 then 'Moderate'
    else 'Cheap'
end as price_category
from books;

-- Drop Index, View, and Table (for cleanup if needed)

-- drop index idx_author on books;
-- drop view recent_borrow;
-- drop table borrow, members, books, authors;
