-- 1. Retrieve the suppliers whose company name ends with "Ltd." and display the supplier ID 
-- and company name, translating the column names into Spanish.
SELECT SUP.SUPPLIERID 'ID DE PROVEEDOR', SUP.COMPANYNAME 'NOMBRE DE COMAPAÑÍA' 
FROM SUPPLIERS AS SUP
WHERE SUP.COMPANYNAME LIKE '%LTD.';

-- 2. Display all the information of suppliers whose contact name starts with the string "chXr", 
-- where X represents any single character.
SELECT SUP.* 
FROM SUPPLIERS AS SUP 
WHERE SUP.CONTACTNAME LIKE 'CH_R%';

-- 3. Display the products with discount along with the order ID and the employee who handled the order.
SELECT ORDT.UnitPrice*0.50 'DESCUENTO', ORD.ORDERID, EMP.EMPLOYEEID
FROM ORDERS AS ORD
JOIN employees AS EMP
ON(ORD.EMPLOYEEID = EMP.EMPLOYEEID)
JOIN orderdetails AS ORDT
ON(ORD.ORDERID = ORDT.ORDERID);

-- 4. Count the customers in each country who have a FAX number.
SELECT COUNT(CUS.COUNTRY)'CLIENTES DISPONE FAX'
FROM CUSTOMERS AS CUS
WHERE FAX <> '';

-- 5. Count the orders shipped by shipping company number 3.
SELECT COUNT(ORD.ORDERID)'PEDIDO ENVIADOS'
FROM ORDERS AS ORD 
WHERE ORD.SHIPVIA = 3;

-- 6. Calculate the average reorder level of products whose names start with C.
SELECT PRODUCTNAME
FROM PRODUCTS AS PRD
WHERE PRODUCTNAME LIKE 'C%';

-- 7. Count the number of categories that have an image.
SELECT COUNT(CAT.CATEGORYID)'NÚMERO DE CATEGORÍA CON IMAGEN'
FROM CATEGORIES AS CAT
WHERE PICTURE <> '';

-- 8. Display the suppliers from London.
SELECT SUP.SUPPLIERID, SUP.CITY
FROM SUPPLIERS AS SUP
WHERE CITY = 'LONDON';

-- 9. Get the total stock units of products with even IDs.
SELECT SUM(PRD.UnitsInStock)'TOTAL UNIDADES EN STOCK'
FROM PRODUCTS AS PRD;

-- 10. For each employee, display the description of their territory along with the territory ID and employee ID.
SELECT EMP.FIRSTNAME, EMP.LASTNAME, EMTR.EMPLOYEEID, EMTR.TERRITORYID, TER.TERRITORYDESCRIPTION
FROM EMPLOYEETERRITORIES AS EMTR
JOIN TERRITORIES AS TER
ON (TER.TERRITORYID = EMTR.TERRITORYID)
JOIN employees AS EMP
ON (EMP.EMPLOYEEID = EMTR.EMPLOYEEID)
GROUP BY EMPLOYEEID;
