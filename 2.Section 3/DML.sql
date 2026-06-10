
-->>DML - Data Manipulation Language
	--Select is mostly used to retrieve the data from tables.
	--Select has multiple optional clauses that control filtering,grouping,sorting and limiting results

	-->SELECT
		-- To retrieve all the data from the table
		USE College;
		GO

		-- To see all the tables in a College database
		SELECT * FROM sys.tables;

		--To see all the schemas
		SELECT name FROM sys.schemas;

		-- To see all the data inside a Students table
		SELECT * FROM academics.Students;

		-- To select a specific column
		SELECT FirstName,Email 
		FROM academics.Students;

	--> WHERE Clause
		--Comparison Operators
			--> =, <> or !=, >, >=, <, <= 
		-- Multiple Conditions
			-->AND, OR, 
		--Reverse the truth value
			--> NOT 
		--Value in a list
			--> IN
		--Range 
			--> BETWEEN
		--Pattern Match
			--> LIKE
		-- Null Check
			--> IS NULL
	
	-->Equal ( = )
		--Find all students whose age is 22.
		SELECT * 
		FROM academics.Students
		WHERE age = 22;

		--Find the student whose first name is 'John'.
		SELECT * 
		FROM academics.Students
		WHERE FirstName = 'John';

		--Find the student whose email is 'emma.johnson02@gmail.com'.
		SELECT * 
		FROM academics.Students
		WHERE Email = 'emma.johnson02@gmail.com';

	--> Not Equal to(<> or !=)
		--Find all students whose age is not 22.
		SELECT * 
		FROM academics.Students
		WHERE age <> 22;
		
		--Find students whose first name is not 'John'.
		SELECT * 
		FROM academics.Students
		WHERE FirstName <> 'John';
		
		--Find all students except the one with StudentId = 10.
		SELECT *
		FROM academics.Students
		WHERE StudentId <>10;

	--> Greater Than ( > )
		--Find all students who are older than 25.
		SELECT *
		FROM academics.Students
		WHERE age > 25;

	--> Greater Than or Equal to ( >= ) and Less than ( < ) 
		--Find all students whose age is between 21 (inclusive) and 25 (exclusive).
		SELECT *
		FROM academics.Students
		WHERE age >= 21 and age < 25;

	--> And
		--Find all students whose age is greater than 20 AND less than 25.
		SELECT *
		FROM academics.Students
		WHERE age > 20 AND age < 25;

	--> OR Operator
		--Find all students whose first name is 'John' OR 'Emma'.
		SELECT * 
		FROM  academics.Students
		WHERE FirstName = 'John' or FirstName = 'Emma';

	--> NOT + IN
		--Find all students whose age is NOT IN (20, 21, 22).
		SELECT *
		FROM academics.Students
		WHERE age NOT IN (20,21,22);

	--> BETWEEN
		-- Find all students whose date of birth is between '2000-01-01' and '2002-12-31'.
		SELECT *
		FROM academics.Students
		WHERE DOB BETWEEN '2000-01-01' and '2002-12-31';

	--> LIKE
		-- Find all students whose first name starts with the letter 'A'.
		SELECT *
		FROM academics.Students
		WHERE FirstName Like 'A%';

	--> IS NULL
		--Assuming some phone numbers have been set to NULL, find all students whose PhoneNumber IS NULL.
		SELECT *
		FROM academics.Students
		WHERE PhoneNumber IS NULL;

	--> Combining all
		--Challenge 1
		/* 
		Bonus Challenge (Combines Multiple Operators)
		Find all students who:
			Age is between 20 and 25
			First name starts with 'J'
			Age is not 22
			And StudentId is in (5, 10, 15, 20, 25)
	
		*/
		SELECT *
		FROM academics.Students
		WHERE Age BETWEEN 20 AND 25
			AND FirstName LIKE 'J%' 
			AND Age <> 22
			AND StudentId IN (5,10,15,20,25);

		--Challenge 2
		/* 
		Can you write a query to find students who:
			Age is between 20 and 25
			First name starts with J or A
			Age is not 22
			StudentId is not in (5,10,15)
			DOB is after '2001-01-01'
		
		*/
		SELECT *
		FROM academics.Students
		WHERE Age BETWEEN 20 AND 25
			AND (FirstName Like 'J%' OR FirstName Like 'A%')
			AND Age <> 22
			And StudentId NOT IN (5,10,15)
			AND DOB > '2001-01-01';

	--> SQL Query Execution Order
		/*
		FROM/JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> DISTINCT -> ORDER BY -> TOP/OFFSET	
		*/

		--> Group BY
			--Group of common columns into a single summary row by using aggregate functions like COUNT,SUM,AVG,MIN,MAX
			TRUNCATE TABLE academics.Students;

			ALTER TABLE academics.Students
			ADD Branch_ID TINYINT NOT NULL;

			SELECT count(*),Branch_ID
			FROM academics.Students
			GROUP BY Branch_ID;

		--> Having
			-- To filter data after grouping bcoz where won't work for group by
			SELECT count(*),Branch_ID
			FROM academics.Students
			GROUP BY Branch_ID
			HAVING count(*) >= 2;

		--> Select
			-- This is executed in fifth order 
			-- We can compute expressions, apply functions,define as alias and construct derived columns here
			
			SELECT 
				StudentID,
				FirstName+' '+LastName AS "Full Name" ,
				YEAR(DOB) AS "Birth Year",
				CASE WHEN  Age > 25 THEN 'Senior'
					WHEN Age <= 25 Then 'Junior'
					Else 'N/A' END 	AS "Level"
			FROM academics.Students;
		
		--> Distinct
			-- TO get Unique records
			SELECT DISTINCT  branch_id 
			FROM  academics.Students;

		--> Order Clause
			-- To sort data default - ASC (Small to big), DESC (BIg to small) 
			SELECT 
			FirstName+' '+LastName AS "Full Name" 
			FROM academics.Students
			ORDER BY FirstName DESC;







	






		




