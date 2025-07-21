use librarydb;

select * from authors;
select * from books;
select * from borrows;
select * from members;

-- Average Book Price by Author (Only for Fiction books)

select a.name as author_name, avg(b.price) as avg_price
from books b
join authors a on b.author_id = a.author_id
where b.genre = 'Fiction'
group by a.name;

-- Minimum & Maximum Book Price by Genre

select genre, min(price) as min_price, max(price) as max_price
from books
where published_year >= 1995
group by genre;

-- Each member & total no. of books borrowed that cost>₹20.

select m.name as member_name, count(b.book_id) as books_borrowed
from borrows br
join members m on br.member_id = m.member_id
join books b on br.book_id = b.book_id
where b.price > 20
group by m.name;


-- Maximum Book Price Borrowed by Each Member

select m.name as member_name, max(b.price) as max_price_borrowed
from borrows br
join members m on br.member_id = m.member_id
join books b on br.book_id = b.book_id
group by m.name;

-- Show all members and their borrowed books, even if no match exists on either side

select m.name as member_name, b.title as book_title
from members m
left join borrows br on m.member_id = br.member_id
left join books b on br.book_id = b.book_id
union
select m.name as member_name, b.title as book_title
from borrows br
right join members m on br.member_id = m.member_id
right join books b on br.book_id = b.book_id;

-- Author & Most Expensive 'Fantasy' Book

select a.name as author_name, max(b.price) as max_fantasy_book_price
from authors a
join books b on a.author_id = b.author_id
where b.genre = 'Fantasy'
group by a.name;











