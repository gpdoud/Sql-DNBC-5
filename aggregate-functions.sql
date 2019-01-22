select format(sum(sales), 'C'), format(avg(sales), 'C'),
min(sales), max(sales),count(*)
 from customers;
