use international_bank

select * from Continent 
select * from [Transaction]
select * from Customers 
 --Display the count of customers in each region who have done the
--transaction in the year 2020.
 

SELECT 
    c.region_name,
    COUNT(DISTINCT cs.customer_id) AS customer_count
FROM Continent c
WHERE c.region_id IN 
    (SELECT cs.region_id 
     FROM Customers cs 
     WHERE cs.customer_id IN 
         (SELECT customer_id 
          FROM [Transaction] 
          WHERE YEAR(txn_date) = 2020))
GROUP BY c.region_name;

--Display the maximum and minimum transaction amount of each
--transaction type.

select * from [Transaction]

select 
       txn_type as transaction_type,
       MIN(txn_amount) as min_amount,
       MAX(txn_amount) as max_amount
from [transaction]
group by txn_type

--Display the customer id, region name and transaction amount where
--transaction type is deposit and transaction amount > 2000.
select * from continent
select * from [transaction]
select * from customers
select 
        t.customer_id,
        ct.region_name,
        t.txn_amount
from [Transaction] t
inner join Customers c
on c.customer_id=t.customer_id
inner join Continent ct
on Ct.region_id=c.region_id
where t.txn_amount > 2000
and t.txn_type='deposit'

 ---Find duplicate records in the Customer table.---whcih one to be picked 
select * from customers;

select 
      customer_id,
      COUNT(*) as duplicate_rows
from Customers
group by customer_id
having COUNT(*) > 1


select 
      region_id,
      COUNT(*) as duplicate_rows
from Customers
group by region_id
having COUNT(*) > 1

--Display the customer id, region name, transaction type and 
--transactionamount for the minimum transaction amount in deposit.
select * from continent
select * from [transaction]
select 
     t.customer_id,
     (select region_name from Continent where txn_type='deposit') as region_name,
     min(txn_amount) as min_transaction_amount
from [Transaction] t
group by txn_amount

----
 Create a stored procedure to display details of customers in the
Transaction table where the transaction date is greater than Jun 2020
select * from Customers
select * from [transaction]


CREATE PROCEDURE GetCustomerSummarys
AS
BEGIN
    SELECT 
        c.customer_id,
        t.txn_date,
        t.txn_amount,
        t.txn_type
    FROM Customers c
    INNER JOIN [Transaction] t
        ON c.customer_id = t.customer_id
    WHERE t.txn_date > '2020-06-30';
END;
select * from [transaction]

exec GetCustomerSummarys


Create a stored procedure to display the details of transactions that
happened on a specific day.

create procedure getdetailsofonedaytxn as
begin
select 
      t.txn_date,
      sum(t.txn_amount) as totalamount
from Customers c
inner join [Transaction] t
on c.customer_id=t.customer_id
group by t.txn_date
having t.txn_date='2020-01-13'

end;

exec getdetailsofonedaytxn

---- Create a user defined function to add 10% of the transaction 
amount in a table.

create function toaddtransactionamount()
returns table as 
return
(select 
        customer_id,
        txn_amount * 0.10 as increased_amount
    from [transaction]);
        
select * from toaddtransactionamount()


10. Create a user defined function to find the total transaction 
amount for a given transaction type.
create function totalamountoftxntype()
returns table 
as 
return 
(select 
       SUM(txn_amount) as totalamount
    from [Transaction]
    where txn_type='deposit');

select * from totalamountoftxntype()

and method

create function totalamounttxntype
( @txntype varchar(50))
returns table as 
return
(select 
       SUM(txn_amount) as totalamount
    from  [Transaction]
    where txn_type=@txntype);

select * from totalamounttxntype('deposit')

-- Create a table value function which comprises the columns 
 customer_id,region_id ,txn_date , txn_type , txn_amount 
 which will retrieve data from the above table.

 create function tablevalue()
 returns table 
 as return
 (select 
         c.customer_id,
         c.region_id,
         t.txn_date,
         t.txn_type,
         t.txn_amount
    from Customers c
    inner join [transaction] t
    on c.customer_id=t.customer_id);

select * from tablevalue()

---Create a TRY...CATCH block to print a region id and region name in a
single column

BEGIN TRY
    SELECT 
        CAST(region_id AS VARCHAR(10)) + ' ' + region_name AS RegionDetails
    FROM  [transaction] 
END TRY
BEGIN CATCH
    SELECT 
        ERROR_MESSAGE() AS ErrorMessage
END catch  

select * from continent


--13. Create a TRY...CATCH block to insert a value in the Continent table.


---14. Create a trigger to prevent deleting a table in a database.






























































