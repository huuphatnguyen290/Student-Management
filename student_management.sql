-------- STUDENT MANAGEMENT DATABASE ------------

CREATE DATABASE Student_Management

USE Student_Management
GO



CREATE TABLE [Departments](
	[department_id] INT IDENTITY (1,1) PRIMARY KEY,
	[department_name] VARCHAR (100) NOT NULL UNIQUE
);



CREATE TABLE [Students] (
	[student_ID] INT IDENTITY(1,1) PRIMARY KEY,
	[first_name] VARCHAR(100) NOT NULL,
	[last_name] VARCHAR(100) NOT NULL,
	[DOB] DATE NULL,
	[email] VARCHAR(150) UNIQUE,
	[department_id] INT NOT NULL,
	FOREIGN KEY ([department_id]) REFERENCES [Departments](department_id)
);


CREATE TABLE [Teachers] (
	[teacher_ID] INT IDENTITY(1,1) PRIMARY KEY,
	[first_name] VARCHAR (100) NOT NULL,
	[last_name] VARCHAR (100) NOT NULL,
	[email] VARCHAR (150) UNIQUE,
	[department_id] INT NOT NULL,
	FOREIGN KEY ([department_id]) REFERENCES [Departments](department_id)
);


CREATE TABLE [Courses](
	[course_id] VARCHAR (50) PRIMARY KEY,
	[course_code] VARCHAR(20) NOT NULL UNIQUE,
	[course_name] VARCHAR(100) NOT NULL,
	[department_id] INT NOT NULL,
	FOREIGN KEY ([department_id]) REFERENCES [Departments](department_id)
);

CREATE TABLE [Sections](
	[section_id] VARCHAR(50) PRIMARY KEY,

	[course_id] VARCHAR (50) NOT NULL,
	[teacher_id] INT NOT NULL,
	[semester] VARCHAR (100) NOT NULL,
	[year] INT NOT NULL,
	FOREIGN KEY ([course_id]) REFERENCES [Courses]([course_id]),
	FOREIGN KEY ([teacher_id]) REFERENCES [Teachers]([teacher_ID])

);
CREATE TABLE [Enrollments](
	[student_ID] INT NOT NULL,
	[section_id] VARCHAR(50) NOT NULL,
	[enrollment_date] DATE NOT NULL,
	[final_grade] VARCHAR(20) NULL,
	PRIMARY KEY ([student_ID], [section_id]),
	FOREIGN KEY ([student_ID]) REFERENCES [Students]([student_ID]),
	FOREIGN KEY ([section_id]) REFERENCES [Sections]([section_id])
);





------------------INSERT VALUES---------------------------
INSERT INTO [Departments] ([department_name])
VALUES ('Computer Science'),
	('Mathematics'),
	('Biology'),
	('Cyber security');

INSERT INTO [Students] ([first_name], [last_name], [DOB], [email], [department_id])
VALUES ('Ryan', 'Nguyen', '2004-05-10', 'ryan.nguyen@email.com', 1),
	('Anna', 'Tran', '2003-08-21', 'anna.tran@email.com', 1),
	('Leo', 'Pham', '2004-01-15', 'leo.pham@email.com', 2),
	('Mia', 'Vo', '2003-11-30', 'mia.vo@email.com', 3),
	('Hai', 'Nguyen', '2002-02-12', 'hainguyen@email.com', 4),
	('Thai', 'Tran', '2002-05-29', 'thaitran@email.com', 4);


INSERT INTO [Teachers] ([first_name], [last_name], [email], [department_id])
VALUES ('John', 'Smith', 'john.smith@school.edu', 1),
	('Emily', 'Davis', 'emily.davis@school.edu', 2),
	('Michael', 'Brown', 'michael.brown@school.edu', 3),
	('Fnu', 'Kalemba', 'fnu.kalemba@school.edu', 4);

INSERT INTO [Courses] ([course_id], [course_code], [course_name], [department_id])
VALUES ('C001', 'COP4530', 'Data Structures', 1),
	('C002', 'CDA3201', 'Computer Logic Design', 1),
	('C003', 'MAC2311', 'Calculus I', 2),
	('C004', 'BSC1010', 'General Biology', 3),
	('C005', 'CBS2450', 'General Cybersecurity', 4),
	('C006', 'CBS2451', 'Advanced Cybersecurity', 4);

INSERT INTO [Sections] ([section_id],[course_id], [teacher_id], [semester],[year])
VALUES ('SEC001', 'C001', 1, 'Spring', 2026),
	('SEC002', 'C002', 1, 'Spring', 2026),
	('SEC003', 'C003', 2, 'Spring', 2026),
	('SEC004', 'C004', 3, 'Spring', 2026),
	('SEC005', 'C005', 3, 'Spring', 2026),
	('SEC006', 'C006', 4, 'Spring', 2026);



INSERT INTO [Enrollments] ([student_ID], [section_id], [enrollment_date], [final_grade])
VALUES
(1, 'SEC001', '2026-01-10', 'A'),
(1, 'SEC002', '2026-01-10', 'B+'),
(2, 'SEC001', '2026-01-11', 'A-'),
(3, 'SEC003', '2026-01-12', 'B'),
(4, 'SEC004', '2026-01-13', 'A'),
(5, 'SEC005', '2026-01-13', 'A+'),
(6, 'SEC006', '2026-01-13', 'C');


SELECT * FROM [Departments];
SELECT * FROM [Students];
SELECT * FROM [Teachers];
SELECT * FROM [Courses];
SELECT * FROM [Sections];
SELECT * FROM [Enrollments];

---- UPDATE section teacher for cyber security class
UPDATE [Sections]
SET [teacher_id] = 4
WHERE [section_id] ='SEC005' 
	AND [course_id] = 'C005';

