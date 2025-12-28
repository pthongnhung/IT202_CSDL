DROP DATABASE IF EXISTS SESSION02;
CREATE DATABASE SESSION02;
USE SESSION02;
CREATE TABLE Classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL,
    school_year INT NOT NULL,
    UNIQUE (class_name, school_year)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL,
    class_id INT NOT NULL
);
ALTER TABLE Students ADD CONSTRAINT fk_student_class FOREIGN KEY (class_id) REFERENCES Classes(class_id);

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    number_credits INT NOT NULL,
    teacher_id INT NOT NULL
);
ALTER TABLE Subjects ADD CONSTRAINT fk_subject_teacher FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id);

CREATE TABLE Enrollments (
    student_id INT,
    subject_id INT,
    register_date DATE NOT NULL,
    PRIMARY KEY (student_id, subject_id)
);
ALTER TABLE Enrollments ADD CONSTRAINT fk_enroll_student FOREIGN KEY (student_id) REFERENCES Students(student_id);
ALTER TABLE Enrollments ADD CONSTRAINT fk_enroll_subject FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id);
CREATE TABLE Scores (
    student_id INT,
    subject_id INT,
    diem_qua_trinh FLOAT,
    diem_cuoi_ky FLOAT,
    PRIMARY KEY (student_id, subject_id),
    CHECK (diem_qua_trinh BETWEEN 0 AND 10),
    CHECK (diem_cuoi_ky BETWEEN 0 AND 10)
);
ALTER TABLE Scores ADD CONSTRAINT fk_score_student FOREIGN KEY (student_id) REFERENCES Students(student_id);
ALTER TABLE Scores ADD CONSTRAINT fk_score_subject FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id);
