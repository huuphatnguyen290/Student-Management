

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

