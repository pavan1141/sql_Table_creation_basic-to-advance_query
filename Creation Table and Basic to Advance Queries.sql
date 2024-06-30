use basic_project;

/* Write a SQL query to create WORKER Table. */
CREATE TABLE WORKER(
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

select *
from worker;

/* Write a SQL Query to insert above values in WORKER Table */

INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE,
DEPARTMENT) VALUES
(1,'Siddharth','Singh',	80000, 2019-03-20 09:00:00,'HR'),
(2,'Vaibhav','Varshney',100000,	2019-02-20 09:00:00	,'Account')
(3,'Pavan kumar','Mylapuru',25000,'2022-08-29 09:00:00','ASD'),
(4,'Komal','Mylapuru',40000,'2024-05-01 09:00:00','Senior developer'),
(5,'Madhu','Sudhan',20000,'2024-06-01 09:00:00','Analysist'),
(6,'Haseeb','Shaik',26000,'2023-08-29 09:00:00','ASD'),
(7,'Roshan','Shaik',25000,'2024-12-01 09:00:00','Tester'),
(8, 'Aman', 'Nain', 75000, '2019-07-11 09:00:00','Account'),
(9, 'Farhaan', 'Majied', 500000, '2019-05-11 09:00:00', 'Admin');


/* 
Write a SQL Query to create table Title which has WORKER_REF_ID
as foreign key */
create table Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
ON DELETE CASCADE
);

INSERT INTO TITLE (
WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM) VALUES
(1,'MANAGER', '2021-06-01 00:00:00' ),
(2,'EXECUTIVE', '2021-06-01 00:00:00' ),
(3,'MANAGER', '2024-06-01 00:00:00' ),
(7,'Asst.MANAGER', '2024-06-01 00:00:00' ),
(4,'LEAD', '2024-06-01 00:00:00' ),
(6,'MANAGER', '2023-06-01 00:00:00' ),
(5,'EXECUTIVE', '2024-06-01 00:00:00' ),
(9,'LEAD', '2021-06-01 00:00:00' ),
(8,'EXECUTIVE', '2021-06-01 00:00:00' );

/* Write a SQL query to create WORKER Table. */
DROP TABLE IF EXISTS JOB_GRADES;
CREATE TABLE JOB_GRADES (
GRADE_LEVEL VARCHAR(19),
LOWEST_SALARY INT(20),
HIGHEST_SALARY INT(20)
);

INSERT INTO JOB_GRADES (GRADE_LEVEL,LOWEST_SALARY,HIGHEST_SALARY)VALUES
('A', 1000,9999),
('B', 10000,19999),
('C',20000,29999),
('D',30000,39999),
('E',40000,49999),
('F',50000,59999),
('G',60000,100000),
('H',100000,1000000);

/* ----> write a SQL query to clone a new table WorkCopy from another table */

/* The general way to clone a table (for MySQL) without is:  */
CREATE TABLE WorkerCopy LIKE Worker;


/* BASIC QUERIES FROM MYSQL */

/* 1.Write a SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>  */

Select First_name as WORKER_NAME
from Worker;

/* 2.Write a SQL query to fetch “FIRST_NAME” from Worker table in upper case. */

Select UPPER(First_name) as WORKER_NAME
from Worker;

/*3. write an SQL query to fetch unique values of DEPARTMENT from Worker table. */

Select distinct department 
from worker;

Select count(distinct department) as NO_Departments
from worker;

/*4. write a SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’. */

Select replace(first_name ,'a','A') as Turn_a_to_A
from worker;

/* 5.write a SQL query to print the FIRST_NAME and LAST_NAME
from Worker table into a single column COMPLETE_NAME. A
space char should separate them. */

Select concat(first_name, " ", last_name) as COMPLETE_NAME
from worker;

/* 6. Write a SQL query to print all Worker details from the Worker table
order by FIRST_NAME Ascending. */

Select *
from worker
order by first_name asc;

/* 7.write a SQL query to print all Worker details from the
Worker table order by FIRST_NAME Ascending and
DEPARTMENT Descending. */

Select *
from worker
order by first_name asc,department desc;

/* 8. write a SQL query to print details for Workers with the first name as “Pavan kumar” and “Komal” from Worker table. */

 Select *
 from worker
 where first_name in ('Pavan kumar','Komal');
 
 /* 9. weite a SQL query to print details of workers excluding first names, “Pavan kumar” and “Komal” from Worker table. */

 Select *
 from worker
 where first_name not in ('Pavan kumar','Komal');
 
 /* 10. write a SQL query to print details of the Workers whose
FIRST_NAME starts with ‘S’. */

Select *
from worker
where first_name like "S%";

/* 11. write a SQL query to print details of the Workers whose FIRST_NAME contains ‘a’. */

Select *
from worker
where first_name like "%a%";

/* 12. write a SQL query to print details of the Workers whose FIRST_NAME ends with 'n’. */

Select *
from worker 
where first_name like "%n";

/* 13. write a SQL query to print details of the Workers whose FIRST_NAME ends with ‘l’ and contains five alphabets. */

Select *
from worker
where first_name like "____l";

/* 14. Write a SQL query to print details of the Workers whose SALARY lies between 100000 and 500000. */

Select *
from worker
where salary between 100000 and 500000;

/* 15.  write a SQL query to print details of the Workers who have joined in Mar’2019. */

Select *
from worker
where year(joining_date)=2019 and month(joining_date)=03;

/* 16. Write a SQL query to show the current date and time. */

Select now() as Current_DATETIME;

/* 17. Write a SQL query to fetch the count of employees working in the department ‘Admin’. */

Select Count(*)
from worker
where department ='admin';
 
 /* 18. write a SQL query to fetch the no.of workers for each department in the descending order. */
 
 Select department,count(worker_id) as No_of_workers
 from worker
 group by department
 order by  No_of_workers desc;
 
 /* 19. write a SQL query to fetch departments along with the total salaries paid for each of them. */
 
 Select department,sum(salary)
 from worker
 group by department;

/* 20. Write a SQL query to show all departments along with the number of people in there */

Select  department,count(worker_id) as NO_of_Worker
from worker
group by department;

/* 21. Write a SQL query to fetch the departments that have less than five people in it. */

Select department,count(worker_id) as No_of_workers
from worker
group by department
having count(worker_id)<=1;

/* 22. Write a SQL query to show one row twice in results from a table with department 'HR'. */

Select *
from worker
where department ="HR"
union all
Select *
from worker
where department ="HR";

/*  23.Write a SQL query to fetch the names of workers who earn the highest salary. */

Select FIRST_NAME,SALARY
from worker
where SALARY =(Select max(salary) from worker);

/* 24. Write a SQL query to show the second highest salary from a table. */

Select max(SALARY)
from worker
where salary not in (select max(salary) from worker);

/* 25. Write a SQL query to show the top n (say 10) records of a table. */

Select *
from worker
order by salary desc
limit 10;

/* 26. Write a SQL query to determine the nth (say n=3) highest salary from a table. */

Select salary
from worker
order by salary desc 
limit 2,1;

/* 27. Write a SQL query to determine the 3rd highest salary without using TOP or limit method. */

Select salary
from worker as w1
where 3 =(select count(distinct(w2.salary))
from worker as w2
where w2.salary >= w1.salary
);

/* Use the following generic method to find nth highest salary
without using TOP or limit. */

Select salary
from worker as w1
where 1=(select count(distinct(w2.salary))   /*4 = (n-1) --- */
from worker as w2
where w2.salary >= w1.salary
);

/* 28. Write a SQL query to fetch three max salaries from a table. */

Select 	distinct (salary)
from worker as a
where 3>= (
select count(distinct(salary))
from worker as b
where a.salary <= b.salary
order by a.salary desc
);

/* 29. Write a SQL query to fetch three min salaries from a table. */

select distinct(salary)
from worker as a
where 3 >= (
select count(distinct(salary))
from worker as b
where a.salary >= b.salary
order by b.salary desc
);

/* 30. Write a SQL query to fetch the list of employees with the same salary. */
 
Select  distinct w.worker_id,w.first_name,w.salary
from worker as w ,worker as w2
where  w.salary = w2.salary and w.worker_id != w2.worker_id;

/* 31. Write a SQL query to print details of the Workers who are also Admin. */

select *
from worker  as w
inner join title as t
on worker_id = worker_ref_id
where worker_title = 'Manager';

/* 32. write a SQL query to find the first name, last name, salary,and job grade for all employees. */

Select w.first_name,w.last_name,w.salary,j.grade_level
from worker as w
join job_grades as j
on w.salary between j.lowest_salary and j.highest_salary;

/* 33. write a SQL query to compute the average salary of Workers for each job title. */

Select worker_title,avg(salary)
from worker
join title 
on worker.worker_id = title.worker_ref_id
group by worker_title;

/* 34.Write a SQL query to print the name of employees having the highest salary in each department. */

Select w.department,w.first_name,w.salary 
from 
(Select max(salary) as total_salary,department 
from worker
group by department) as Max_sal
inner join worker as w
on Max_sal.department =w.department and Max_sal.total_salary = w.salary;

/* 35. Write a SQL query to create a view for those Worker belonging to the Department 'HR'.*/

Create view HRStaff
as select *
from worker 
where department ="HR";









