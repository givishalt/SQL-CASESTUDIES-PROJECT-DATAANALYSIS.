create database casestudy2
use casestudy2

CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

insert into location 
values (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');

create table department (
Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);

INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

CREATE TABLE JOB
(JOB_ID INT PRIMARY KEY,
DESIGNATION VARCHAR(20))

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')

CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))
  
INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)
--simple queries
--1. List all the employee details.
--2. List all the department details. 
--3. List all job details. 
--4. List all the locations. 

select * from employee
select * from department
select * from JOB
select * from location

--5. List out the First Name, Last Name, Salary, Commission for 
all Employees.

select first_name,
       last_name,
       salary,
       comm
from employee

--6) List out the Employee ID, Last Name, Department ID for all employees and 
alias 
Employee ID as "ID of the Employee", Last Name as "Name of the 
Employee", Department ID as "Dep_id".
select * from employee
select 
       employee_id as [id of the employee],
       last_name as [name of the employee],
       department_id as Dep_id
from EMPLOYEE;

7)  List out the annual salary of the employees with their names only.

select 
       first_name +' '+last_name as names ,
       salary
from employee

==== Where Condition
-- list the details about smith
select 
      *
from EMPLOYEE
where LAST_NAME='smith'

--
--List out the employees who are working in department 20
select 
       * 
from EMPLOYEE
where DEPARTMENT_ID=20

-- . List out the employees who are earning salary between 2000 and 
3000. 

select 
         *
from EMPLOYEE 
where  SALARY  between 2000 and 3000


--. List out the employees who are working in department 10 or 20.
select 
      *
from EMPLOYEE 
where DEPARTMENT_ID = 10 or DEPARTMENT_ID=20

-- Find out the employees who are not working in department 10 or 
30. 

select 
         * 
from EMPLOYEE
where DEPARTMENT_ID<> 10 or DEPARTMENT_ID<> 20

-- List out the employees whose name starts with 'L'. 
select 
       *
from employee
where FIRST_NAME like 'l%'

--List out the employees whose name starts with 'L' and ends with 'E'.
select 
     *
from employee
where first_name like 'l%' 
and LAST_NAME like '%e'

===or====

select 
       * 
from EMPLOYEE
where FIRST_NAME like 'l%e'

--List out the employees whose name length is 4 and start with 'J'. 
select 
      first_name,
      LEN(first_name) as nameof_fourchar
from EMPLOYEE
where FIRST_NAME like 'j%'

--  List out the employees who are working in department 30 and 
draw the  salaries more than 2500.
select 
        * from 
EMPLOYEE
where DEPARTMENT_ID= 30
and SALARY> 2500

--  10. List out the employees who are not receiving commission. 
select 
       *
from EMPLOYEE
where COMM is null


=== order by ===

 --List out the Employee ID and Last Name in ascending order 
 based on the Employee ID. 
select * from employee
 select 
        employee_id,
        last_name
from EMPLOYEE
order by employee_id

--List out the Employee ID and Name in descending order based 
on salary. 

select 
      EMPLOYEE_id,
      last_name,
      salary
from EMPLOYEE
order by SALARY desc;

--List out the employee details according to their Last 
Name in ascending-order.

select 
       * 
from EMPLOYEE
order by LAST_NAME desc;

--List out the employee details according to their Last Name in
ascending order and then Department ID in descending order. 

select 
       *
from EMPLOYEE
order by LAST_NAME asc,
department_id desc;

==GROUP BY and HAVING Clause: 

-- List out the department wise maximum salary, minimum
salary and average salary of the employees. 

select   
       department_id,
       MIN(salary) as min_salary,
       AVG(salary) as avg_salary
from EMPLOYEE
group by department_id

--2. List out the job wise maximum salary, minimum salary 
and average salary of the employees.

select * from employee
select 
       job_id,
       MIN(salary) as min_salary,
       MAX(salary)  as max_salary,
       AVG(salary) as avg_salary
from EMPLOYEE
group by job_id


--3. List out the number of employees who joined each month 
in ascending order. 
select * from job
select * from employee

select 
      COUNT(*) as total_employees,
      month(hire_date ) as joined_month
from EMPLOYEE
group by month(hire_date )


4. List out the number of employees for each month and year in 
ascending order based on the year and month. 

select 
      year(hire_date) as joined_year,
      month(hire_date) as joined_month,
      count(*) as total_employee
from employee
group by  year(hire_date),
          month(hire_date)
order by
          year(hire_date) asc,
          month(hire_date)asc
          
5. List out the Department ID having at least four employees.

select 
       department_id,
       count(*) as number_of_employee
from employee
group by department_id
having count(*)  >= 4

--How many employees joined in February month. 
select 
      month(hire_date) as joined_month,
      COUNT(*) as total_employee
from EMPLOYEE
GROUP by MONTH(HIRE_DATE)
having MONTH(HIRE_DATE)=2


-- How many employees joined in May or June month.
select 
      month(hire_date) as joined_month,
      COUNT(*) as total_employee
from EMPLOYEE
GROUP by MONTH(HIRE_DATE)
having MONTH(HIRE_DATE) IN (5,6)

8. How many employees joined in 1985? 
select 
      year(hire_date) as joined_year,
      COUNT(*) as total_employee
from EMPLOYEE
GROUP by year(HIRE_DATE)
having YEAR(hire_date) = 1985

9. How many employees joined each month in 1985?

select 
       MONTH(hire_date) as hire_month,
       YEAR( hire_date) as hire_year,
       COUNT(*) as total_employee
from EMPLOYEE
group by MONTH(hire_date),
         YEAR(hire_date)
having YEAR(hire_date)=1985

10. How many employees were joined in April 1985? 
select 
       MONTH(hire_date) as hire_month,
       YEAR( hire_date) as hire_year,
       COUNT(*) as total_employee
from EMPLOYEE
where MONTH(hire_date)=4
group by MONTH(hire_date),
         YEAR(hire_date)
having YEAR(hire_date)=1985


11. Which is the Department ID having greater than or equal to 
3 employees joining in April 1985? 

select ------- doubt
       department_id,
       MONTH(hire_date) as hire_month,
       YEAR(hire_date) as hire_year,
       COUNT(*) as  total_employee
from EMPLOYEE
where MONTH(hire_date) = 4
and YEAR(hire_date) = 1985
group by DEPARTMENT_ID
having COUNT(*) >= 3

====joins=====
 ---List out employees with their department names.
 select * from EMPLOYEE
 select * from department

select 
      
      e.first_name as employee_name,
      d.name as department_name

from employee e
inner join department d
on e.department_id= d.department_id

2. Display employees with their designations.
select * from department
select * from EMPLOYEE
select * from job

select 
       E.first_name as employee_name,
       j.designation as employee_designation 
from EMPLOYEE e
inner  join JOB j
on e.JOB_ID=j.job_id


3. Display the employees with their department names and city.
 select * from LOCATION;
 select * from department;
 select 
       e.first_name as employee_name,
       d.name as department_name,
       l.city as  city_name
from employee e
inner join department d
on d.DEPARTMENT_ID= E.department_id
inner join LOCATION l
on l.Location_ID=d.location_id


4. How many employees are working in different departments? 
Display with department names. 
select * from EMPLOYEE
select * from department 

select 
        d.name as department_name ,
        COUNT(*) as numberofemp
from EMPLOYEE e
left join department d
on e.DEPARTMENT_ID=d.Department_Id
group by d.name
      

5. How many employees are working in the sales department? 
 select 
       d.name as departmenname,
       COUNT(*) as  numberofemp
from EMPLOYEE e
inner join department d
on e.DEPARTMENT_ID= d.Department_Id
where d.name='sales'
group by d.name



---Which is the department having greater than or equal to 3 
employees and display the department names in 
ascending order. 

select 
      d.name as  department_name ,
      count(employee_id) as no_of_emp
from department d
left join employee e
on d.department_id=e.department_id
group by d.name
having count(employee_id) >= 3
order by d.Name asc
-----different join but answer same
SELECT 
      d.name AS department_name,
      COUNT(*) AS no_of_emp
FROM department d
INNER JOIN employee e
       ON d.department_id = e.department_id
GROUP BY d.name
HAVING COUNT(*) >= 3
ORDER BY d.name ASC;

7. How many employees are working in 'Dallas'?
select * from employee
select * from location
select * from job
select * from department

select 
       l.city ,
       count(*) as no_of_emp
from LOCATION l
inner  join department d
on l.Location_ID=d.Location_Id
inner join employee e 
on e.department_id=d.department_id
group by l.city
having l.City='dallas' 

8. Display all employees in sales or operation departments. 

select 
      d.name as department_name,
      COUNT(*) as no_of_employees
from EMPLOYEE e 
inner join department d
on d.Department_Id=e.department_id  
group by d.Name
having d.Name in ('sales','operation')---- doubt


==== conditional statement===
 --Display the employee details with salary grades. Use conditional 
 statement to create a grade column. 

 select * from employee

 select 
          *,
       case 
       when salary< 1000 then 'low'
       when salary between 1000 and  2000 then 'average'
       when salary between 2000 and 3000 then 'high'
       
       end  as grade 
from employee

---2. List out the number of employees grade wise. Use conditional statement to 
create a grade column.






3. Display the employee salary grades and the number of employees between 
2000 to 5000 range of salary.


select * from employee

SELECT salary_grade,
       COUNT(*) AS number_of_employees
FROM (
        SELECT 
               CASE 
                    WHEN salary BETWEEN 2000 AND 3000 THEN '2000-3000'
                    WHEN salary BETWEEN 3001 AND 4000 THEN '3001-4000'
                    WHEN salary BETWEEN 4001 AND 5000 THEN '4001-5000'
               END AS salary_grade
        FROM EMPLOYEE
        WHERE salary BETWEEN 2000 AND 5000
     ) AS t
GROUP BY salary_grade
ORDER BY salary_grade;

=== subqueries===

1. Display the employees list who got the maximum salary. 
select 
         *
from EMPLOYEE
where SALARY= (select MAX(SALARY) from EMPLOYEE)

2. Display the employees who are working in the sales department. 
SELECT *
FROM employee
WHERE department_id = (
    SELECT department_id
    FROM department
    WHERE name = 'Sales'
);


3. Display the employees who are working as 'Clerk'. 
select * 
from  EMPLOYEE
where job_id= ( select 
              JOB_ID
        from JOB  
        where DESIGNATION='clerk');
              

select * from employee
select * from job

4. Display the list of employees who are living in 'Boston'. 

select 
       * 
from EMPLOYEE
where DEPARTMENT_ID = (select 
                             DEPARTMENT_ID
                        from department
                        where location_id = (select
                                             location_id
                                       from LOCATION 
                                       where city='boston'))

select * from  location
select * from  employee
select * from  department  
select * from job

5. Find out the number of employees working in the sales department.

select 
       COUNT(*) as total_number_of_emp
from EMPLOYEE
where DEPARTMENT_ID=(select 
                     DEPARTMENT_ID
                     from department
                     where Name='sales')

6. Update the salaries of employees who are working as clerks on the basis of 10%. 

UPDATE EMPLOYEE
set SALARY =  SALARY *110/100
where JOB_ID=(select 
              JOB_ID
              from  JOB
              where designation='clerk')
select * from employee
use casestudy2
7. Display the second highest salary drawing employee details. 
select *
from EMPLOYEE
where salary=( select 
               MAX(salary) 
               from EMPLOYEE
               where SALARY < (select MAX(SALARY) from EMPLOYEE))

8. 
List out the employees who earn more than every employee in department 30. 
select 
      *
from  employee
where salary>
(select MAX(salary)
from EMPLOYEE
where DEPARTMENT_ID=30)

--Find out which department has no employees. 
select * from employee
select 
       d.name as department_name
from department d
where not exists ( select 1
                 from EMPLOYEE e
                 where E.department_id=d.department_id );

10. Find out the employees who earn greater than the average salary for 
their department.

SELECT emp_name
FROM
(
    SELECT first_name AS emp_name,
           salary,
           AVG(salary) OVER (PARTITION BY department_id) AS dept_avg
    FROM employee
) t
WHERE salary > dept_avg;






