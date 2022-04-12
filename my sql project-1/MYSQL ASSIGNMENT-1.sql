#1Q.ans:
use hr;
select first_name "first name",last_name "last name" from employees;
#2Q.ANS:
select distinct department_id from employees;
#3Q.ANS:
select* from employees order by first_name desc;
#4Q.ANS:
select FIRST_NAME,LAST_NAME,SALARY,SALARY*.15 PF from employees;
#5Q.ANS:
select EMPLOYEE_ID ,FIRST_NAME,LAST_NAME,SALARY from employees order by salary;
#6Q.ANS:
select sum(SALARY) from employees;
#7Q.ANS:
select max(SALARY),min(SALARY) from employees;
#8Q.ANS:
select avg(SALARY), count(*) FROM employees;
#9Q.ANS:
select count(*) from employees;
#10Q.ANS:
select count(distinct JOB_ID) FROM employees;
#11Q.ANS:
select upper(FIRST_NAME) from employees;
#12Q.ANS:
select substring(FIRST_NAME, 1,3) from employees; 
#13Q.ANS:
select trim(FIRST_NAME) from employees;
#14Q.ANS:
select FIRST_NAME,LAST_NAME,length(FIRST_NAME)+length(LAST_NAME) 'LENTH OF NAMES'from employees;
#15Q.ANS:
select* from employees where first_name regexp'(0-9)';
#16Q.ANS:
select FIRST_NAME,LAST_NAME,SALARY,department_ID from employees
where salary not between 10000 AND 15000;
#17Q.ANS:
select FIRST_NAME,LAST_NAME,department_id from employees
where department_id in (30,100) order by department_id asc;
#18Q.ANS:
select FIRST_NAME,LAST_NAME,SALARY,department_ID  from employees
where salary not between 10000 and 15000 and department_id in(30,100);
#19Q.ANS:
select FIRST_NAME,LAST_NAME,HIRE_DATE
from employees
where year(HIRE_DATE) like'1987';
#20Q.ANS:
select FIRST_NAME from employees 
where first_name like'%B%' and last_name like '%C%';
#21Q.ANS:
select LAST_NAME,JOB_ID,SALARY from employees
where job_id in ('PROG','CLERK') 
and salary not in(4500,10000,15000);
#22Q.ANS:
SELECT 
last_name
FROM employees
WHERE last_name LIKE '______';

# 23rdQ:
SELECT 
last_name
FROM employees
WHERE last_name LIKE '__e%';

# 24th Q:
SELECT 
job_id,
employee_id
FROM employees
WHERE job_id IN ('AC_ACCOUNT','AC_MGR','AD_ASST','AD_PRES','AD_VP','FI_ACCOUNT') 
AND employee_id IN(206, 205, 200, 100, 101, 102, 110, 113, 111, 109, 112);

# 25th Q:

SELECT * FROM employees;
SET sql_safe_updates = 0;
UPDATE employees
SET phone_number = REPLACE(phone_number, '124', '999')
WHERE phone_number LIKE '%124%';

# 26th Q:
SELECT * 
FROM employees
WHERE length(first_name) >= 8;


# 27th Q:
SELECT * FROM employees;
SET sql_safe_updates = 0;
ALTER TABLE employees
MODIFY COLUMN email VARCHAR(50) NOT NULL;
UPDATE employees SET email = CONCAT( email, '@example.com');

# 28th Q:
SELECT 
RIGHT(phone_number, 4) AS last_four_number
FROM employees;

# 29th Q:
SELECT 
location_id,
street_address,
SUBSTRING_INDEX(REPLACE(REPLACE(REPLACE(street_address,',',' '),')',' '),'(',' '),' ',-1)
AS 'Last_word_of_street_address'
FROM locations;

# 30th Q:
SELECT *
FROM locations
WHERE length(street_address) <= (SELECT min(length(street_address))
FROM locations);

# 31st Q:
SELECT 
job_title,
substr(job_title,1, instr(job_title, ' ')-1) 
AS first_word_of_job_title
FROM jobs;

# 32nd Q:
SELECT
first_name,
last_name AS last_name_contains_C_after_2nd_position,
length(first_name) AS length_of_the_first_name
From employees
WHERE last_name LIKE '__%c%'; 

# 33rd Q:
SELECT
first_name,
length(first_name) AS length_of_the_first_name_starts_with_A_or_J_or_M
From employees
WHERE first_name REGEXP '^A' OR '^J' OR '^M'; 

# 34th Q:
SELECT
first_name,
lpad(salary, 10, '$') AS SALARY
FROM employees;

# 35th Q:
SELECT
left(first_name, 8),
REPEAT('$', floor(salary/1000))'SALARY($)', salary
FROM employees
ORDER BY salary DESC;

# 36th Q:
SELECT
employee_id,
first_name,
last_name,
hire_date
FROM employees
WHERE position("07" IN date_format(hire_date, '%d %m %Y'))>0;

#2nd DATABASE:

use northwind;
#1Q.ANS:
select productname,quantityperunit
from products;
#2Q.ANS:
select PRODUCTID , productNAME
from products
where Discontinued ="FALSE"
order by ProductName;
#3Q.ANS:
select  productid , productname 
from products
where Discontinued = 1
order by productname;
#4Q.ANS:
select productname ,unitprice 
from products
order by ProductName desc;
#5Q.ANS:
select productNAME , UNITPRICE 
from products
where ((UnitPrice)<20) and ((Discontinued)=false)
order by UnitPrice desc;
#6Q.ANS:
 select productname , unitprice
 from products
 where (((UnitPrice)>=15 and (unitprice)<=25)
 and ((products.Discontinued)=false))
 order by products.UnitPrice desc;
 #7Q.ANS:
 select distinct productname ,unitprice
 from products
 where UnitPrice > (select avg(UnitPrice)from products)
 order by UnitPrice;
 #8Q.ANS:
 select distinct productname as twenty_most_expensive_products, unitprice
 from products as a
 where 20 >= (select count(distinct UnitPrice)
 from products as b
 where b. UnitPrice >=a.UnitPrice)
 order by UnitPrice desc;
 #9Q.ANS:
 select count(productNAME)
 from products
 group by Discontinued;
 #10Q.ANS:
 select  productname , unitsonorder , unitsisstock
 from products
 where (((Discontinued)=false) and ((UnitsInStock) < UnitsOnOrder));
 
