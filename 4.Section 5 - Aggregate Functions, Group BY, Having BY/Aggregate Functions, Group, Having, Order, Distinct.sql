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
	
	-->>Aggregate Functions with GROUP BY
	-- Count students in each branch
		SELECT Branch_ID, COUNT(*) AS TotalStudents
		FROM academics.Students
		GROUP BY Branch_ID;
		-- Output:
		-- Branch_ID | TotalStudents
		-- 1         | 20
		-- 2         | 20
		-- 3         | 20
		-- 4         | 20
		-- 5         | 20

		-- Average age by branch
		SELECT Branch_ID, AVG(Age) AS AvgAge
		FROM academics.Students
		GROUP BY Branch_ID;
		-- Output:
		-- Branch_ID | AvgAge
		-- 1         | 23.8
		-- 2         | 24.1
		-- ...

		-- Youngest student age in each branch
		SELECT Branch_ID, MIN(Age) AS Youngest
		FROM academics.Students
		GROUP BY Branch_ID;
		-- Output:
		-- Branch_ID | Youngest
		-- 1         | 20
		-- 2         | 20
		-- ...

		-- Oldest student age in each branch
		SELECT Branch_ID, MAX(Age) AS Oldest
		FROM academics.Students
		GROUP BY Branch_ID;
		-- Output:
		-- Branch_ID | Oldest
		-- 1         | 28
		-- 2         | 27
		-- ...

		-- Total age by branch
		SELECT Branch_ID, SUM(Age) AS TotalAge
		FROM academics.Students
		GROUP BY Branch_ID;
		-- Output:
		-- Branch_ID | TotalAge
		-- 1         | 476
		-- 2         | 482
		-- ...

	-->> Aggregate Functions with WHERE
		-- Count students older than 25
		SELECT COUNT(*)
		FROM academics.Students
		WHERE Age > 25;
		-- Output: 25 (example)

		-- Average age of students in Branch 1
		SELECT AVG(Age)
		FROM academics.Students
		WHERE Branch_ID = 1;
		-- Output: 23.8

		-- Maximum age in Branch 3
		SELECT MAX(Age)
		FROM academics.Students
		WHERE Branch_ID = 3;
		-- Output: 28

		-- Minimum age in Branch 5
		SELECT MIN(Age)
		FROM academics.Students
		WHERE Branch_ID = 5;
		-- Output: 20

	-->>Aggregate Functions with HAVING
		-- Branches having more than 15 students
		SELECT Branch_ID, COUNT(*) AS StudentCount
		FROM academics.Students
		GROUP BY Branch_ID
		HAVING COUNT(*) > 15;
		-- Output:
		-- Branch_ID | StudentCount
		-- 1         | 20
		-- 2         | 20
		-- ...

		-- Branches whose average age is greater than 23
		SELECT Branch_ID, AVG(Age) AS AvgAge
		FROM academics.Students
		GROUP BY Branch_ID
		HAVING AVG(Age) > 23;
		-- Output:
		-- Branch_ID | AvgAge
		-- 1         | 23.8
		-- ...
	
	-->> Most Common Interview Examples
		-- Total students
		SELECT COUNT(*) FROM academics.Students;
		-- Output: 100

		-- Average age
		SELECT AVG(Age) FROM academics.Students;
		-- Output: 23.5

		-- Youngest student
		SELECT MIN(Age) FROM academics.Students;
		-- Output: 20

		-- Oldest student
		SELECT MAX(Age) FROM academics.Students;
		-- Output: 28

		-- Total of all ages
		SELECT SUM(Age) FROM academics.Students;
		-- Output: 2350

		-- Number of students per branch
		SELECT Branch_ID, COUNT(*)
		FROM academics.Students
		GROUP BY Branch_ID;
		-- Output:
		-- Branch_ID | Count
		-- 1         | 20
		-- 2         | 20
		-- ...

	-->>Execution Order with Aggregates
	/* 
	FROM
	WHERE
	GROUP BY
	HAVING
	SELECT
	ORDER BY
	*/

	---------------------------------------------------------------------------------------------------------------------------------

	-->> Scalar String Functions
		-- Scalar Function: one that operates on a single value as a result.
			/*LEN()
			DATALENGTH()
			UPPER()
			LOWER()
			LTRIM()
			RTRIM()
			TRIM()
			LEFT()
			RIGHT()
			SUBSTRING()
			CHARINDEX()
			PATINDEX()
			REPLACE()
			STUFF()
			REPLICATE()
			SPACE()
			REVERSE()
			ASCII()
			CHAR()
			UNICODE()
			NCHAR()
			CONCAT()
			CONCAT_WS()
			CAST()
			CONVERT()
			FORMAT()
			STRING_ESCAPE()
			QUOTENAME()
			TRANSLATE()
			SOUNDEX()
			DIFFERENCE()
			JSON_VALUE()
			JSON_QUERY()
			*/
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

		-->> Most Important Interview Functions
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


------------------------------------------------------------------------------------------------

-->> Date Funtions
	/* 
		GETDATE()            --> Current Date & Time
		SYSDATETIME()        --> Current Date & Time (High Precision)
		GETUTCDATE()         --> UTC Date & Time
		YEAR()               --> Extract Year
		MONTH()              --> Extract Month
		DAY()                --> Extract Day
		DATEPART()           --> Extract Any Date Part
		DATENAME()           --> Month/Day Name
		DATEADD()            --> Add Date Part
		DATEDIFF()           --> Difference Between Dates
		EOMONTH()            --> End Of Month
		DATEFROMPARTS()      --> Create Date
		DATETIMEFROMPARTS()  --> Create Datetime
		FORMAT()             --> Format Date
		CURRENT_TIMESTAMP    --> Current Datetime
		ISDATE()             --> Validate Date
	
	*/

		-- Returns current date and time
		SELECT GETDATE();
		-- Output: 2026-06-08 10:30:45.123

		-- Returns current date and time with higher precision
		SELECT SYSDATETIME();
		-- Output: 2026-06-08 10:30:45.1234567

		-- Returns current UTC date and time
		SELECT GETUTCDATE();
		-- Output: 2026-06-08 15:30:45.123

		-- Returns current UTC date and time with higher precision
		SELECT SYSUTCDATETIME();
		-- Output: 2026-06-08 15:30:45.1234567

		-- Returns current date
		SELECT CAST(GETDATE() AS DATE);
		-- Output: 2026-06-08

		-- Returns current time
		SELECT CAST(GETDATE() AS TIME);
		-- Output: 10:30:45.1233333

		-- Extracts year from a date
		SELECT YEAR('2026-06-08');
		-- Output: 2026

		-- Extracts month from a date
		SELECT MONTH('2026-06-08');
		-- Output: 6

		-- Extracts day from a date
		SELECT DAY('2026-06-08');
		-- Output: 8

		-- Returns specified date part
		SELECT DATEPART(YEAR, '2026-06-08');
		-- Output: 2026

		-- Returns name of month
		SELECT DATENAME(MONTH, '2026-06-08');
		-- Output: June

		-- Adds years to a date
		SELECT DATEADD(YEAR, 2, '2026-06-08');
		-- Output: 2028-06-08

		-- Adds months to a date
		SELECT DATEADD(MONTH, 3, '2026-06-08');
		-- Output: 2026-09-08

		-- Adds days to a date
		SELECT DATEADD(DAY, 10, '2026-06-08');
		-- Output: 2026-06-18

		-- Calculates difference in years
		SELECT DATEDIFF(YEAR, '2000-06-28', '2026-06-08');
		-- Output: 26

		-- Calculates difference in months
		SELECT DATEDIFF(MONTH, '2025-01-01', '2026-06-08');
		-- Output: 17

		-- Calculates difference in days
		SELECT DATEDIFF(DAY, '2026-06-01', '2026-06-08');
		-- Output: 7

		-- Returns last day of the month
		SELECT EOMONTH('2026-06-08');
		-- Output: 2026-06-30

		-- Returns last day of next month
		SELECT EOMONTH('2026-06-08', 1);
		-- Output: 2026-07-31

		-- Creates a date from parts
		SELECT DATEFROMPARTS(2026, 6, 8);
		-- Output: 2026-06-08

		-- Creates a datetime from parts
		SELECT DATETIMEFROMPARTS(2026,6,8,10,30,45,0);
		-- Output: 2026-06-08 10:30:45.000

		-- Returns date as formatted string
		SELECT FORMAT('2026-06-08', 'dd/MM/yyyy');
		-- Output: 08/06/2026

		-- Returns current timestamp
		SELECT CURRENT_TIMESTAMP;
		-- Output: 2026-06-08 10:30:45.123

		-- Checks if date is valid
		SELECT ISDATE('2026-06-08');
		-- Output: 1

		-- Returns date only from datetime
		SELECT CONVERT(DATE, GETDATE());
		-- Output: 2026-06-08

		-- Returns first day of current month
		SELECT DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1);
		-- Output: 2026-06-01

		-- Returns age in years
		SELECT DATEDIFF(YEAR, '2000-06-28', GETDATE());
		-- Output: 26

	-->> Most Common Interview Examples
		-- Students born after 2002
		SELECT *
		FROM academics.Students
		WHERE DOB > '2002-01-01';
		-- Output: Matching student records

		-- Students born in 2001
		SELECT *
		FROM academics.Students
		WHERE YEAR(DOB) = 2001;
		-- Output: Students born in 2001

		-- Students born in June
		SELECT *
		FROM academics.Students
		WHERE MONTH(DOB) = 6;
		-- Output: Students having June birthdays

		-- Students older than 25
		SELECT *
		FROM academics.Students
		WHERE DATEDIFF(YEAR, DOB, GETDATE()) > 25;
		-- Output: Matching student records

		-- Number of students born each year
		SELECT YEAR(DOB) AS BirthYear,
			   COUNT(*) AS StudentCount
		FROM academics.Students
		GROUP BY YEAR(DOB);
		-- Output:
		-- BirthYear | StudentCount
		-- 1998      | 10
		-- 1999      | 12
		-- ...
			
			
	-->> Frequently Used Date Parts
		-- Year
		SELECT DATEPART(YEAR, GETDATE());
		-- Output: 2026

		-- Quarter
		SELECT DATEPART(QUARTER, GETDATE());
		-- Output: 2

		-- Month
		SELECT DATEPART(MONTH, GETDATE());
		-- Output: 6

		-- Day
		SELECT DATEPART(DAY, GETDATE());
		-- Output: 8

		-- Week
		SELECT DATEPART(WEEK, GETDATE());
		-- Output: 24

		-- Weekday
		SELECT DATEPART(WEEKDAY, GETDATE());
		-- Output: 2

		-- Hour
		SELECT DATEPART(HOUR, GETDATE());
		-- Output: 10

		-- Minute
		SELECT DATEPART(MINUTE, GETDATE());
		-- Output: 30

		-- Second
		SELECT DATEPART(SECOND, GETDATE());
		-- Output: 45

-----------------------------------------------------------------------------------------------------------------------------

-->> Numeric Functions
	/* 
		ABS()       --> Absolute value
	CEILING()   --> Next highest integer
	FLOOR()     --> Next lowest integer
	ROUND()     --> Round to decimals
	SQRT()      --> Square root
	POWER()     --> Power calculation
	SQUARE()    --> Square of number
	EXP()       --> Exponential (e^x)
	LOG()       --> Natural logarithm
	LOG10()     --> Log base 10
	SIGN()      --> Positive/Negative/Zero indicator
	RAND()      --> Random number
	PI()        --> Pi constant
	DEGREES()   --> Radians to degrees
	RADIANS()   --> Degrees to radians
	%           --> Modulus operator
	*/


		-- Returns absolute value (removes negative sign)
		SELECT ABS(-25);
		-- Output: 25

		-- Returns ceiling value (next highest integer)
		SELECT CEILING(12.3);
		-- Output: 13

		-- Returns floor value (next lowest integer)
		SELECT FLOOR(12.9);
		-- Output: 12

		-- Rounds a number to specified decimal places
		SELECT ROUND(123.4567, 2);
		-- Output: 123.46

		-- Rounds down using truncate logic
		SELECT ROUND(123.4567, 2, 1);
		-- Output: 123.45

		-- Returns square root
		SELECT SQRT(25);
		-- Output: 5

		-- Returns power of a number
		SELECT POWER(2, 3);
		-- Output: 8

		-- Returns square of a number
		SELECT SQUARE(5);
		-- Output: 25

		-- Returns exponential value (e^x)
		SELECT EXP(1);
		-- Output: 2.718281828...

		-- Returns logarithm (natural log)
		SELECT LOG(10);
		-- Output: 2.302585...

		-- Returns log base 10
		SELECT LOG10(100);
		-- Output: 2

		-- Returns sign of a number
		SELECT SIGN(-50);
		-- Output: -1

		SELECT SIGN(0);
		-- Output: 0

		SELECT SIGN(50);
		-- Output: 1

		-- Returns random number between 0 and 1
		SELECT RAND();
		-- Output: 0.123456 (random)

		-- Random number with seed
		SELECT RAND(5);
		-- Output: fixed random value

		-- Returns PI value
		SELECT PI();
		-- Output: 3.14159265358979

		-- Converts radians to degrees
		SELECT DEGREES(PI());
		-- Output: 180

		-- Converts degrees to radians
		SELECT RADIANS(180);
		-- Output: 3.14159

		-- Returns remainder (modulus)
		SELECT 10 % 3;
		-- Output: 1

		-- Another way using function
		SELECT ABS(10 % 3);
		-- Output: 1

	-->> Interview Examples
		-- Find absolute salary difference
		SELECT ABS(10000 - 7500);
		-- Output: 2500

		-- Round student ages average
		SELECT ROUND(AVG(Age), 2)
		FROM academics.Students;
		-- Output: 23.45

		-- Find square root example
		SELECT SQRT(144);
		-- Output: 12

		-- Generate random student sample
		SELECT TOP 5 *
		FROM academics.Students
		ORDER BY NEWID();
		-- Output: Random 5 students


