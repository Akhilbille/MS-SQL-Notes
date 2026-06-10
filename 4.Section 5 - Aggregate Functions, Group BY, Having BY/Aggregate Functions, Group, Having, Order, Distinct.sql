-->> SQL Funtions
	--> Aggregate Functions
		-- Perform calculations on a set of values and return a single value.
		-- They are used with GROUP BY to summarize the data.

		/*
			COUNT()          --> Counts rows
			COUNT(column)    --> Counts non-NULL values
			COUNT(DISTINCT)  --> Counts unique values
			SUM()            --> Total of values
			AVG()            --> Average value
			MIN()            --> Smallest value
			MAX()            --> Largest value
		
		*/
		
		-- To see all details of a table
			
			SELECT MAX(Branch_ID)
			FROM academics.Students
			GROUP BY Branch_ID;
		-- Returns the total number of rows
		SELECT COUNT(*) FROM academics.Students;
		-- Output: 100

		-- Returns the number of non-NULL values
		SELECT COUNT(Email) FROM academics.Students;
		-- Output: 100

		-- Returns the number of distinct values
		SELECT COUNT(DISTINCT Age) FROM academics.Students;
		-- Output: 9 (example)

		-- Returns the sum of all ages
		SELECT SUM(Age) FROM academics.Students;
		-- Output: 2350 (example)

		-- Returns the average age
		SELECT AVG(Age) FROM academics.Students;
		-- Output: 23.50 (example)

		-- Returns the minimum age
		SELECT MIN(Age) FROM academics.Students;
		-- Output: 20

		-- Returns the maximum age
		SELECT MAX(Age) FROM academics.Students;
		-- Output: 28
	
	--> Scalar String Functions
		-- Scalar Function: one that operates on a single value as a result.
			-- Returns the number of characters in a string
			SELECT LEN('Microsoft SQL Server');
			-- Output: 20

			-- Returns the total bytes used by a string
			SELECT DATALENGTH('Microsoft SQL Server');
			-- Output: 20

			-- Converts string to uppercase
			SELECT UPPER('sql server');
			-- Output: SQL SERVER

			-- Converts string to lowercase
			SELECT LOWER('SQL SERVER');
			-- Output: sql server

			-- Removes leading spaces
			SELECT LTRIM('   SQL Server');
			-- Output: SQL Server

			-- Removes trailing spaces
			SELECT RTRIM('SQL Server   ');
			-- Output: SQL Server

			-- Removes leading and trailing spaces
			SELECT TRIM('   SQL Server   ');
			-- Output: SQL Server

			-- Returns part of a string
			SELECT SUBSTRING('Microsoft SQL Server', 11, 3);
			-- Output: SQL

			-- Returns leftmost characters
			SELECT LEFT('Microsoft SQL Server', 9);
			-- Output: Microsoft

			-- Returns rightmost characters
			SELECT RIGHT('Microsoft SQL Server', 6);
			-- Output: Server

			-- Finds the position of a substring
			SELECT CHARINDEX('SQL', 'Microsoft SQL Server');
			-- Output: 11

			-- Finds the position of a pattern
			SELECT PATINDEX('%SQL%', 'Microsoft SQL Server');
			-- Output: 11

			-- Replaces occurrences of a substring
			SELECT REPLACE('Microsoft SQL Server', 'SQL', 'Azure SQL');
			-- Output: Microsoft Azure SQL Server

			-- Replaces characters by position
			SELECT STUFF('Microsoft SQL Server', 11, 3, 'Azure SQL');
			-- Output: Microsoft Azure SQL Server

			-- Repeats a string
			SELECT REPLICATE('SQL ', 3);
			-- Output: SQL SQL SQL

			-- Returns a string with specified spaces
			SELECT 'A' + SPACE(5) + 'B';
			-- Output: A     B

			-- Reverses a string
			SELECT REVERSE('SQL Server');
			-- Output: revreS LQS

			-- Returns ASCII code of first character
			SELECT ASCII('A');
			-- Output: 65

			-- Returns character from ASCII code
			SELECT CHAR(65);
			-- Output: A

			-- Returns Unicode value of first character
			SELECT UNICODE('A');
			-- Output: 65

			-- Returns Unicode character
			SELECT NCHAR(65);
			-- Output: A

			-- Concatenates strings
			SELECT CONCAT('SQL', ' ', 'Server');
			-- Output: SQL Server

			-- Concatenates strings with separator
			SELECT CONCAT_WS('-', '2025', '06', '08');
			-- Output: 2025-06-08

			-- Converts expression to string
			SELECT CAST(123 AS VARCHAR(10));
			-- Output: 123

			-- Converts expression to string
			SELECT CONVERT(VARCHAR(10), GETDATE(), 120);
			-- Output: 2026-06-08 (example)

			-- Formats a value
			SELECT FORMAT(GETDATE(), 'yyyy-MM-dd');
			-- Output: 2026-06-08 (example)

			-- Escapes special JSON characters
			SELECT STRING_ESCAPE('SQL "Server"', 'json');
			-- Output: SQL \"Server\"

			-- Quotes a string as a valid identifier
			SELECT QUOTENAME('Employee Name');
			-- Output: [Employee Name]

			-- Translates characters
			SELECT TRANSLATE('123-456-7890', '-', '.');
			-- Output: 123.456.7890

			-- Returns SOUNDEX code
			SELECT SOUNDEX('Smith');
			-- Output: S530

			-- Compares SOUNDEX values
			SELECT DIFFERENCE('Smith', 'Smyth');
			-- Output: 4

			-- Returns JSON value
			SELECT JSON_VALUE('{"Name":"John"}', '$.Name');
			-- Output: John

			-- Returns JSON array/object
			SELECT JSON_QUERY('{"Skills":["SQL","Python"]}', '$.Skills');
			-- Output: ["SQL","Python"]

		--> Most Important Interview Functions
			-- Length of a string
			SELECT LEN('Akhil');
			-- Output: 5

			-- Convert to uppercase
			SELECT UPPER('akhil');
			-- Output: AKHIL

			-- Convert to lowercase
			SELECT LOWER('AKHIL');
			-- Output: akhil

			-- First 3 characters
			SELECT LEFT('Microsoft', 3);
			-- Output: Mic

			-- Last 3 characters
			SELECT RIGHT('Microsoft', 3);
			-- Output: oft

			-- Extract part of string
			SELECT SUBSTRING('Microsoft', 2, 4);
			-- Output: icro

			-- Find character position
			SELECT CHARINDEX('o', 'Microsoft');
			-- Output: 5

			-- Replace text
			SELECT REPLACE('SQL Server', 'SQL', 'Azure SQL');
			-- Output: Azure SQL Server

			-- Reverse string
			SELECT REVERSE('SQL');
			-- Output: LQS

			-- Join strings
			SELECT CONCAT('Akhil', ' ', 'Bille');
			-- Output: Akhil Bille


			
