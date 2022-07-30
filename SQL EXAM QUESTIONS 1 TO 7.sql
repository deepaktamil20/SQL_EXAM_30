###SQL EXAM QUESTIONS

SELECT * FROM task_1.orders;
select * from task_1.orders inner join task_1.salesman on (task_1.orders.salesman_id=task_1.salesman.salesman_id);
CREATE index sales_comm on task_1.orders(salesman_id);

###   1. Write a SQL query which will sort out the customer and their grade 
##who made an order. Every customer must have a grade and be served 
#by at least one seller, who belongs to a region.
SELECT customer.cust_name AS "Customer", customer.grade AS "Grade"
FROM task_1.orders, salesman, customer WHERE task_1.orders.customer_id = customer.custemor_id
AND task_1.orders.salesman_id = salesman.salesman_id AND salesman.city IS NOT NULL
AND customer.grade IS NOT NULL ORDER BY customer.grade DESC;

### 2. Write a query for extracting the data from the order table for the salesman who earned the maximum commission.
select * from task_1.orders where salesman_id = "5001"; 


###  3.  From orders retrieve only ord_no, purch_amt, ord_date, ord_date, 
##salesman_id where salesman’s city is Nagpur(Note salesman_id of 
#orderstable must be other than the list within the IN operator.)
SELECT ord_no, purch_amt, ord_date, salesman_id FROM task_1.orders WHERE salesman_id IN (
SELECT salesman_id
FROM salesman WHERE city='nagpur');

##  4. Write a query to create a report with the order date in such a way 
##that the latest order date will come last along with the total purchase amount and the
#total commission for that date is (15 % for all sellers)
SELECT ord_date, SUM(purch_amt), 
SUM(purch_amt)*.15 
FROM task_1.orders
GROUP BY ord_date 
ORDER BY ord_date;

###   5.  Retrieve ord_no, purch_amt, ord_date, ord_date, salesman_id from 
##Orders table and display only those sellers whose purch_amt is 
#greater than average purch_amt.
SELECT ord_no, purch_amt, ord_date, salesman_id FROM task_1.orders
WHERE purch_amt >(SELECT  AVG(purch_amt) FROM task_1.orders);

###  6. Write a query to determine the Nth (Say N=5) highest purch_amt from Orders table.
select purch_amt from task_1.orders order by purch_amt desc limit 1 offset 4; 
select * from task_1.orders inner join task_1.salesman on (task_1.orders.salesman_id=task_1.salesman.salesman_id);

###  7.(i) Entity - An easily recognisable real-world thing, whether it is material or intangible, can be an entity. 
##Students, professors, employees, departments, and projects, for instance, can all 
#be referred to as entities in a database for a college. Each entity has a few related characteristics that give it a name.

## (ii)Relationships- Relationships or connections between things that are connected.
#As an illustration, the wage table and the employees table in the same database can be linked.



