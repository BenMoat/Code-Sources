
--Directory change test
--'SELECT' Example (S)
	/*Extracts ALL data from a database*/
		SELECT column1, column2,
		FROM TABLE_NAME;
--'SELECT' Example (F)

--'SELECT DISTINCT' Example (S) 1
	--'SELECT DISTINCT' = returns only distinct (different) values.
		SELECT DISTINCT column1, column2,
		FROM TABLE_NAME;
--'SELECT DISTINCT' Example 2
	--Lists the number of different (distinct) customer countries--
		SELECT COUNT(DISTINCT Country) FROM Customers;
--'SELECT DISTINCT' Example (F)

--'WHERE' Clause Example (S)
	--WHERE Clause = filter records that fulfill a specified condition--
		SELECT column1, column2,
		FROM table_name
		WHERE condition,
--'WHERE' Clause Example (F)

--'AND' Syntax Example (S)
	--'AND' Syntax = displays a record if all conditions separated by AND is TRUE
		SELECT column1, column2,
		FROM TABLE_NAME
		WHERE condition1 AND condition2 AND condition3;
--'AND' Syntax Example (F)

--'OR' Syntax Example (S)
	--'OR' Syntax = displays a record if any of the conditions separated by OR is TRUE
		SELECT column1, column2,
		FROM table_name
		FROM table_name WHERE condition1 OR condition2 OR condition3;
--'OR' Syntax Example (F)

--'NOT' Syntax Example (S)
	--'NOT' Syntax = displays a record where the specified condition is NOT met
		SELECT * FRP, Customers
		WHERE NOT Country='Germany';

--Combining AND, OR and NOT Example (S)
	SELECT * FROM Customers
	WHERE Coutnry='Germany' AND (City='Berlin') OR City='Munchen'
	--Including the NOT statement..
	..WHERE NOT Country='Germany' AND NOT Country='USA';
--Combining AND, OR and NOT Example (F)

--'ORDER BY' Syntax Example (S)
	--'ORDER BY' = used to sort the result-set in ascending or descending order
		SELECT column1, column2,
		FROM table_name
		ORDER BY column1, column2, ASC|DESC;
--'ORDER BY' Syntax Example (F)

--'INSERT INTO' Syntax Example (S)
	-- First example specifies both the column names and the values to be inserted
		INSERT INTO table_name (column1, column2, column3),
		VALUES (value1, value2, value3)
	--Adding values for all the columns of the table
		INSERT INTO table_name
		VALUES (value1, value2, value3)
--'INSERT INTO' Syntax Example (F)

--'UPDATE' Examples (S)
	--'UPDATE' Statement Example (F)
	--'UPDATE' Statement = used to modify existing records in a table
		UPDATE TABLE_NAMESET column1 = value1, column2 = value2,
		WHERE condition;
	--'UPDATE' Statement Example (F)
	--'UPDATE' Table Example (S)
		UPDATE Customers
		SET ContactName = 'Joe Bloggs', City= 'London'
		WHERE CustomerID = 1;
	--'UPDATE' Table Example (F)
	--'UPDATE' Multiple Records Example (S)
		UPDATE Customers
		SET ContactName='Ben'
		WHERE Country='England';
	--'UPDATE' Multiple Records Example (F)
--'UPDATE' Examples (F)

--'%'(wildcard) Example (S)
	--'%' Starting.. (S)
	--'%' = city STARTING with 'Ber'
		SELECT * FROM Customers
		WHERE City LIKE 'ber%';
	--'%' Starting.. (F)
	--'%' Containing.. (S)
		SELECT * FROM Customers
		WHERE City LIKE '%es%'
	--'%' Containing.. (F)
	--'%' Charlist.. (S)
	--Selects column with words starting with "b", "s" and "p"
		SELECT * FROM Customers
		WHERE City LIKE '[bsp]%';
	--!charlist = does the same but selects columns with the words NOT starting with "b", "s" and "p"
	--'%' Charlist.. (F)
--'%' (wildcard) Example (S)
	--
--'%' (wildcard) Example (F)
