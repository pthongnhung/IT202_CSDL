DROP DATABASE IF EXISTS SESSION02;
CREATE DATABASE SESSION02;
USE SESSION02;
CREATE TABLE Student(
	student_id int unsigned primary key,
    fullName varchar(50) not null
);
CREATE TABLE Subjects(
	subject_id int unsigned primary key ,
    subject_name varchar(50) not null,
    number_credits int unsigned
);
CREATE TABLE Enrollment(
	student_id int unsigned,
    subject_id int unsigned,
	register_date date not null,
    primary key(student_id, subject_id)
);
ALTER TABLE Enrollment ADD CONSTRAINT Fk_Enrollment_student FOREIGN KEY (student_id) REFERENCES Student(student_id);
ALTER TABLE Enrollment ADD CONSTRAINT Fk_Enrollment_subject FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id);