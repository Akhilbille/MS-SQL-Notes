CREATE SCHEMA academics AUTHORIZATION  dbo;
go

create table academics.Students(
	StudentId INT IDENTITY(1,1) PRIMARY KEY, --surrogate key
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL UNIQUE,
	PhoneNumber VARCHAR(15) NOT NULL UNIQUE,
	age TINYINT  NOT NULL,
	DOB DATE NOT NULL
)

go

INSERT INTO academics.Students VALUES (
	'Akhil','Bille','akhil@gmail.com','8688393058',26,'06/28/2000'
)
go

SELECT * FROM academics.Students;

INSERT INTO academics.Students
(FirstName, LastName, Email, PhoneNumber, Age, DOB)
VALUES
('John','Smith','john.smith01@gmail.com','9000000001',24,'2001-01-15'),
('Emma','Johnson','emma.johnson02@gmail.com','9000000002',22,'2003-02-10'),
('Michael','Brown','michael.brown03@gmail.com','9000000003',27,'1998-03-22'),
('Sophia','Davis','sophia.davis04@gmail.com','9000000004',21,'2004-04-18'),
('William','Miller','william.miller05@gmail.com','9000000005',25,'2000-05-09'),
('Olivia','Wilson','olivia.wilson06@gmail.com','9000000006',23,'2002-06-11'),
('James','Moore','james.moore07@gmail.com','9000000007',28,'1997-07-13'),
('Ava','Taylor','ava.taylor08@gmail.com','9000000008',20,'2005-08-21'),
('Benjamin','Anderson','ben.anderson09@gmail.com','9000000009',26,'1999-09-14'),
('Charlotte','Thomas','charlotte.thomas10@gmail.com','9000000010',24,'2001-10-05'),

('Daniel','Jackson','daniel.jackson11@gmail.com','9000000011',22,'2003-01-17'),
('Mia','White','mia.white12@gmail.com','9000000012',21,'2004-02-28'),
('Matthew','Harris','matthew.harris13@gmail.com','9000000013',25,'2000-03-03'),
('Amelia','Martin','amelia.martin14@gmail.com','9000000014',23,'2002-04-16'),
('David','Thompson','david.thompson15@gmail.com','9000000015',27,'1998-05-24'),
('Harper','Garcia','harper.garcia16@gmail.com','9000000016',20,'2005-06-30'),
('Joseph','Martinez','joseph.martinez17@gmail.com','9000000017',26,'1999-07-08'),
('Evelyn','Robinson','evelyn.robinson18@gmail.com','9000000018',24,'2001-08-19'),
('Samuel','Clark','samuel.clark19@gmail.com','9000000019',22,'2003-09-12'),
('Abigail','Rodriguez','abigail.rodriguez20@gmail.com','9000000020',21,'2004-10-25'),

('Andrew','Lewis','andrew.lewis21@gmail.com','9000000021',28,'1997-11-11'),
('Emily','Lee','emily.lee22@gmail.com','9000000022',23,'2002-12-14'),
('Joshua','Walker','joshua.walker23@gmail.com','9000000023',24,'2001-01-20'),
('Elizabeth','Hall','elizabeth.hall24@gmail.com','9000000024',22,'2003-02-08'),
('Sofia','Young','sofia.young26@gmail.com','9000000026',20,'2005-04-07'),
('Christopher','Allen','christopher.allen25@gmail.com','9000000025',25,'2000-03-26'	),
('Anthony','Hernandez','anthony.hernandez27@gmail.com','9000000027',27,'1998-05-13'),
('Ella','King','ella.king28@gmail.com','9000000028',24,'2001-06-22'),
('Ryan','Wright','ryan.wright29@gmail.com','9000000029',23,'2002-07-29'),
('Scarlett','Lopez','scarlett.lopez30@gmail.com','9000000030',21,'2004-08-10');