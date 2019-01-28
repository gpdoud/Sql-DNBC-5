-- using like
-- _ underscore matches exactly 1 character
-- % percent matches any number of characters even zero
-- any other character must match exactly

/*
	using like
	_ underscore matches exactly 1 character
	% percent matches any number of characters even zero
*/

-- a 'C' followed by an 'F'
select name from customers where name like '%C%F%';  --this is a comment too
-- a 'g' in pos 5
select name from customers where name like '____g%';
-- name contains the word BANK
select name from customers where name like '%BANK%';
-- second char is an 'a'
select name from customers where name like '_A%';

select *
from customers
order by name