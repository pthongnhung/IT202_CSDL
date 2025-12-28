DROP DATABASE IF EXISTS SESSION02;
CREATE DATABASE SESSION02;
USE SESSION02;
CREATE TABLE Studenta(
	msv_student int unique primary key,
    fullName varchar(50) not null
);
CREATE TABLE Subject(
	subject_id int unique primary key,
    subject_name varchar(50) not null,
    number_credits int unsigned
);
