-->>DCL
	-- Two level roles 
		-- 1. Server Level Roles 
			-- sysadmin: has complete control over th eentire instance.
			-- serveradmin: managing server wide settings
			-- securityadmin: handles logins and permissions
			-- processadmin: for managing processes
			-- setupadmin: for linked servers (connect other database instances)
			-- bulkadmin: for bulk inserts
			-- diskadmin: for disk files (physical files where db info lives)
			-- dbcreator: for creating and altering databases
		-- 2. Database Level Roles
			-- db_owner: Full database control
			-- db_datareader: SELECT on all tables in database 
			-- db_datawriter: INSERT, UPDATE, DELETE on all tables 
			-- db_ddladmin: Execute DDL statements 
			-- db_securityadmin: Manage role membership and permissions
			-- db_backupoperator: Backup the database 
			-- public: Default role — all users are members

	-- to see all the server level roles
		SELECT name,type_desc
		FROM sys.server_principals
		WHERE type IN ( 'S', 'U', 'G', 'C', 'R' ,'E');
			
	-- to see all database level roles
		SELECT name,type_desc
		FROM sys.database_principals
		WHERE type IN ( 'S', 'U', 'G', 'A', 'R' ,'X', 'K' );
		/*
		The letters in that WHERE clause represent different types of principals within the database.
		The letter 'S' stands for a standard SQL user, and 'U' is for a Windows user.
		Then, 'A' is for an application role, 'G' denotes a Windows group, and 'K' is an asymmetric key-mapped user.
		Finally, the letter 'R' stands for a database role, like the ones we discussed earlier, and 'X' is a certificate-mapped user.
		*/
	-- To see actual users
		SELECT name,type_desc
		FROM sys.database_principals
		WHERE type IN ( 'S', 'U');

--> SERVER LEVEL USER
	--create user server level
	CREATE LOGIN root WITH PASSWORD = 'root';

	--To add roles
	ALTER SERVER ROLE securityadmin 
	ADD MEMBER root;

	-- TO remove the root user from 
	ALTER SERVER ROLE securityadmin
	DROP MEMBER root;

	-- To delete Login at server level
		DROP LOGIN root;

	--later (linked servers,server level auditing,how to configure server options using sp_configure like managing memory or setting the maximum degree of parallelism, server level logs)

	-- To see all the roles assigned to User in server level
	select 
		r.name AS RoleName,
		m.name AS MemberName
	FROM 
		sys.server_role_members srm 
	JOIN
		sys.server_principals r ON srm.role_principal_id = r.principal_id 
	JOIN 
		sys.server_principals m ON srm.member_principal_id = m.principal_id;


	--> To see all the roles assigned to a user in database level
		-- 1. Connect first to a specific database
			use College;
		-- 2. Use below query
			SELECT	
				r.name AS DatabaseRoleName,
				m.name AS DatabaseUserName
			FROM
				sys.database_role_members rm
			JOIN
				sys.database_principals r ON rm.role_principal_id = r.principal_id
			JOIN
				sys.database_principals m ON rm.member_principal_id = m.principal_id;

--> DATABASE LEVEL USERS
		--1. Make sure connected to correct database.
			USE College;
		
		--2. creating a user databse level with login user from server level
			-- Now they get a default public role 
			CREATE USER root FOR LOGIN root;

			--TO delete this user in this db
			DROP USER root;

			-- to see all the users in a databse
			SELECT 
				name 
			FROM
				sys.database_principals
			WHERE
				type_desc = 'SQL_USER';

--> Creating Roles
	--First create role and to this role assign permissions  and then assign users to group them.
		CREATE ROLE db_myownrole;

	-- Drop a role
		DROP ROLE db_myownrole;

	--> DCL Commands: To provide permissions in database level. 
		-- GRANT: To give permissions.
		-- REVOKE: To remove permissions.
		-- DENY: To expilicitly block the permissions to a user.

		--> GRANT : to give permissions
			-- ON: specific objects like schemas, table, view, stored procedures, functions, sequences(Surrogate keys)
			-- TO: to a specific User

			-- Grant SELECT on a table 
			GRANT SELECT ON dbo.Employees TO ReportingUser; 

			  -- Grant multiple permissions 
			GRANT SELECT, INSERT, UPDATE ON dbo.Orders TO AppUser; 

			  -- Grant with GRANT OPTION (user can grant to others) 
			GRANT SELECT ON dbo.Products TO SalesManager WITH GRANT OPTION;
			
			  -- Grant schema-level permission 
			GRANT SELECT ON SCHEMA::dbo TO ReadOnlyRole; 

			  -- Grant EXECUTE on stored procedure 
			GRANT EXECUTE ON dbo.usp_GetEmployees TO AppRole; 

			  -- Azure SQL: Add user to role 
			ALTER ROLE db_datareader ADD MEMBER [jane.doe@company.com];

			-- All possible ways to Grant a permission
				GRANT SELECT ON academics.Students TO TestUser;

				-- Grant INSERT permission
				GRANT INSERT ON academics.Students TO TestUser;

				-- Grant UPDATE permission
				GRANT UPDATE ON academics.Students TO TestUser;

				-- Grant DELETE permission
				GRANT DELETE ON academics.Students TO TestUser;

				-- Grant multiple permissions
				GRANT SELECT, INSERT, UPDATE, DELETE
				ON academics.Students
				TO TestUser;

				-- Grant EXECUTE permission on a stored procedure
				GRANT EXECUTE ON OBJECT::academics.usp_GetStudents TO TestUser;

				-- Grant ALTER permission on a table
				GRANT ALTER ON OBJECT::academics.Students TO TestUser;

				-- Grant REFERENCES permission
				GRANT REFERENCES ON academics.Students TO TestUser;

				-- Grant CONTROL permission
				GRANT CONTROL ON academics.Students TO TestUser;

				-- Grant VIEW DEFINITION permission
				GRANT VIEW DEFINITION ON OBJECT::academics.Students TO TestUser;

				-- Grant SELECT permission on a specific column
				GRANT SELECT ON OBJECT::academics.Students(Email) TO TestUser;

				-- Grant UPDATE permission on a specific column
				GRANT UPDATE ON OBJECT::academics.Students(Branch_ID) TO TestUser;

				-- Grant CREATE TABLE permission
				GRANT CREATE TABLE TO TestUser;

				-- Grant CREATE VIEW permission
				GRANT CREATE VIEW TO TestUser;

				-- Grant CREATE PROCEDURE permission
				GRANT CREATE PROCEDURE TO TestUser;

				-- Grant CREATE FUNCTION permission
				GRANT CREATE FUNCTION TO TestUser;

				-- Grant CONNECT permission
				GRANT CONNECT TO TestUser;

				-- Grant SELECT permission on an entire schema
				GRANT SELECT ON SCHEMA::academics TO TestUser;

				-- Grant permission WITH GRANT OPTION
				-- Allows the user to grant the same permission to others
				GRANT SELECT ON academics.Students
				TO TestUser
				WITH GRANT OPTION;
			
		--> REVOKE: To remove permissions
			-- ON:  specific object like a table, sp, vw
			-- FROM:  specific user

			-- Revoke a permission 
			REVOKE SELECT ON dbo.Employees FROM ReportingUser; 
			 -- Revoke with CASCADE (revokes grants passed on) 
			REVOKE SELECT ON dbo.Products FROM SalesManager CASCADE;

			-- All Possible revoke operations
				-- Revoke SELECT permission from a user
				REVOKE SELECT ON academics.Students FROM TestUser;

				-- Revoke INSERT permission from a user
				REVOKE INSERT ON academics.Students FROM TestUser;

				-- Revoke UPDATE permission from a user
				REVOKE UPDATE ON academics.Students FROM TestUser;

				-- Revoke DELETE permission from a user
				REVOKE DELETE ON academics.Students FROM TestUser;

				-- Revoke EXECUTE permission on a stored procedure
				REVOKE EXECUTE ON OBJECT::academics.usp_GetStudents FROM TestUser;

				-- Revoke ALTER permission on a table
				REVOKE ALTER ON OBJECT::academics.Students FROM TestUser;

				-- Revoke REFERENCES permission
				REVOKE REFERENCES ON academics.Students FROM TestUser;

				-- Revoke CONTROL permission
				REVOKE CONTROL ON academics.Students FROM TestUser;

				-- Revoke VIEW DEFINITION permission
				REVOKE VIEW DEFINITION ON OBJECT::academics.Students FROM TestUser;

				-- Revoke SELECT permission on a specific column
				REVOKE SELECT ON OBJECT::academics.Students(Email) FROM TestUser;

				-- Revoke UPDATE permission on a specific column
				REVOKE UPDATE ON OBJECT::academics.Students(Branch_ID) FROM TestUser;

				-- Revoke CREATE TABLE permission
				REVOKE CREATE TABLE FROM TestUser;

				-- Revoke CREATE VIEW permission
				REVOKE CREATE VIEW FROM TestUser;

				-- Revoke CREATE PROCEDURE permission
				REVOKE CREATE PROCEDURE FROM TestUser;

				-- Revoke CREATE FUNCTION permission
				REVOKE CREATE FUNCTION FROM TestUser;

				-- Revoke CONNECT permission
				REVOKE CONNECT FROM TestUser;

				-- Revoke SELECT permission on an entire schema
				REVOKE SELECT ON SCHEMA::academics FROM TestUser;

				-- Revoke permission with CASCADE (also revokes permissions granted by the user)
				REVOKE SELECT ON academics.Students FROM TestUser CASCADE;
		
		--> DENY: To restrict permissions
			
			-- All possible DENY Operations
				-- Deny SELECT permission
				DENY SELECT ON academics.Students TO TestUser;

				-- Deny INSERT permission
				DENY INSERT ON academics.Students TO TestUser;

				-- Deny UPDATE permission
				DENY UPDATE ON academics.Students TO TestUser;

				-- Deny DELETE permission
				DENY DELETE ON academics.Students TO TestUser;

				-- Deny multiple permissions at once
				DENY SELECT, INSERT, UPDATE, DELETE
				ON academics.Students
				TO TestUser;

				-- Deny EXECUTE permission on a stored procedure
				DENY EXECUTE ON OBJECT::academics.usp_GetStudents TO TestUser;

				-- Deny ALTER permission on a table
				DENY ALTER ON OBJECT::academics.Students TO TestUser;

				-- Deny REFERENCES permission
				DENY REFERENCES ON academics.Students TO TestUser;

				-- Deny CONTROL permission
				DENY CONTROL ON academics.Students TO TestUser;

				-- Deny VIEW DEFINITION permission
				DENY VIEW DEFINITION ON OBJECT::academics.Students TO TestUser;

				-- Deny SELECT permission on a specific column
				DENY SELECT ON OBJECT::academics.Students(Email) TO TestUser;

				-- Deny UPDATE permission on a specific column
				DENY UPDATE ON OBJECT::academics.Students(Branch_ID) TO TestUser;

				-- Deny CREATE TABLE permission
				DENY CREATE TABLE TO TestUser;

				-- Deny CREATE VIEW permission
				DENY CREATE VIEW TO TestUser;

				-- Deny CREATE PROCEDURE permission
				DENY CREATE PROCEDURE TO TestUser;

				-- Deny CREATE FUNCTION permission
				DENY CREATE FUNCTION TO TestUser;

				-- Deny CONNECT permission
				DENY CONNECT TO TestUser;

				-- Deny SELECT permission on an entire schema
				DENY SELECT ON SCHEMA::academics TO TestUser;


