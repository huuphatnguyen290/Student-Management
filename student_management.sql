-------- STUDENT MANAGEMENT DATABASE ------------

CREATE DATABASE Student_Management

USE Student_Management
GO

CREATE TABLE [Students] (
	[ID] INT PRIMARY KEY,
	[name] VARCHAR(250),
	[class] VARCHAR(10),
	[GPA] FLOAT,
);


CREATE TABLE [Teachers] (
	[ID] INT PRIMARY KEY,
	[name] VAR
);


CREATE TABLE [Classes]();
CREATE TABLE [Sections]();
CREATE TABLE [Enrollment]();
CREATE TABLE [Departments]();
