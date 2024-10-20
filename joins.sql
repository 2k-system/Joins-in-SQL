use mydb0;

-- Display the employee names and department names of all the employees working in the job type Salesman as well as Analyst
SELECT 
    ename AS 'Name of the Employee',
    deptno AS 'Department Number'
FROM
    emp
WHERE
    job = 'salesman' OR job = 'analyst';
     
    --  Display the following report.
SELECT 
    ename AS ENAME,
    CONCAT(ename, ' works in ', dname) AS 'DEPARTMENT NAME'
FROM
    emp e
        JOIN
    dept d ON e.deptno = d.deptno;
 
 --  Display the highest salary for each job within each department as per the following report –
SELECT 
    dname AS 'Department',
    job AS 'JOB',
    MAX(sal) AS 'Highest Sal'
FROM
    emp e
        JOIN
    dept d ON e.deptno = d.deptno
GROUP BY dname , job
 
  --  Display employee name, department name, location and job for all employees of MANAGER job having salary above 2900.
SELECT 
    ename AS 'Name of the Employee',
    dname AS 'Department Name',
    job AS 'JOB'
FROM
    emp e
        JOIN
    dept d ON e.deptno = d.deptno
WHERE
    job = 'MANAGER' AND sal > 2900
 
  -- Display the name of the employees reporting to KING.
SELECT 
    e1.ename AS 'Name', e2.ename AS 'Name of the Manager'
FROM
    emp e1
        JOIN
    emp e2 ON e1.mgr = e2.empno
WHERE
    e2.ename = 'KING'
 
  -- Display the count of employees reporting to KING.
SELECT 
    e2.ename AS 'Manaer Name', COUNT(e1.ename) AS Count
FROM
    emp e1
        JOIN
    emp e2 ON e1.mgr = e2.empno
WHERE
    e2.ename = 'King'
 
   --  Produce the following output –
SELECT 
    CONCAT('The manager of ',
            e1.ename,
            ' is ',
            e2.ename) AS 'Manager Name'
FROM
    emp e1
        JOIN
    emp e2 ON e1.mgr = e2.empno
 
    -- Flight Data --
SELECT 
    c.custname, f.status
FROM
    customers c
        JOIN
    flights f ON c.flightno = f.flightno
WHERE
    f.status = 'Departure On Time'
 
 --    Display the names of those customers who are not flying from Pune to Bangalore
SELECT 
    c.custname, f.route
FROM
    customers c
        JOIN
    flights f ON c.flightno = f.flightno
WHERE
    f.route <> 'Pune-Bangalore'
 
-- Display the names of those customers who all are going from Gate number 1.
SELECT 
    c.custname AS 'Name', f.gateno AS 'Gate No'
FROM
    customers c
        JOIN
    flights f ON c.flightno = f.flightno
WHERE
    gateno = 'g1'
 
-- Display the names of those customers who are going to Chandigad through King Fisher airlines only.
SELECT 
    c.custname AS 'Name',
    f.route AS 'Route',
    f.flightname AS 'Flight Name'
FROM
    customers c
        JOIN
    flights f ON c.flightno = f.flightno
WHERE
    flightname = 'King Fisher'
        AND route REGEXP 'Chandigad$'
 
    -- Generate the following report –
SELECT 
    cd.custid AS 'CUSTID',
    cd.cname AS 'CNAME',
    IFNULL(p.amount, '') AS Amount,
    CONCAT('Customer ',
            CASE status
                WHEN 'paid' THEN 'Present'
                ELSE 'Absent'
            END,
            ' in Payment_Details') AS Remark
FROM
    customer_details cd
        LEFT OUTER JOIN
    payment_details p ON cd.custid = p.custid

--  Display the customer id, customer name, status and amount of the customers who have paid as well as those who have not paid.
SELECT 
    cd.custid AS 'CUSTID',
    cd.cname AS 'CNAME',
    pd.status AS 'Status',
    pd.amount AS 'Amount'
FROM
    customer_details cd
        LEFT OUTER JOIN
    payment_details pd ON cd.custid = pd.custid

-- Display transaction id, continent name, country name, city name, amount allocated and amount spent.
SELECT 
    tr.trid AS 'Transaction ID',
    cont.name_of_continent AS 'Name of Continent',
    tr.name_of_city AS 'City Name',
    cont.continent_amount_allocated,
    conti.country_amount_allocated,
    tr.amount_spent AS 'Amount'
FROM
    transactions tr
        JOIN
    country_master conti ON tr.countryid = conti.countryid
        JOIN
    continent_master cont ON cont.continentid = conti.continentid
 
-- Display the total amount spent for each city, within each country from each continent.
SELECT 
    ct.name_of_continent,
    ctr.name_of_country,
    tr.name_of_city,
    tr.amount_spent AS 'Amount'
FROM
    transactions tr
        JOIN
    country_master ctr ON tr.countryid = ctr.countryid
        JOIN
    continent_master ct ON ct.continentid = ctr.continentid

 