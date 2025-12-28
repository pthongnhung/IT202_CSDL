DROP DATABASE IF EXISTS SESSION02;
CREATE DATABASE SESSION02;
USE SESSION02;
CREATE TABLE Teacher(
	teacher_id int unsigned primary key,
    fullName varchar(50) not null,
    email varchar(50) unique
);
CREATE TABLE Subjects(
	subject_id int unique primary key,
    teacher_id int unsigned ,
    subject_name varchar(50) not null,
    number_credits int unsigned
);
ALTER TABLE Subjects ADD CONSTRAINT Fk_Subjects_Teacher foreign key (teacher_id) references Teacher(teacher_id);
