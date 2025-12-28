DROP DATABASE IF EXISTS SESSION02;
CREATE DATABASE SESSION02;
USE SESSION02;
CREATE TABLE Classes(
	class_id int unsigned auto_increment primary key,
    class_name varchar(50) not null,
    school_year int unsigned not null
);
CREATE TABLE Students(
	student_id int unsigned auto_increment primary key,
    fullName varchar(50) not null,
    birthday date not null,
    class_id int unsigned not null
);
ALTER TABLE Students ADD CONSTRAINT Fk_Student_Class FOREIGN KEY (class_id) references Classes(class_id);
