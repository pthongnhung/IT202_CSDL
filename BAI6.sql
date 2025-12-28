DROP DATABASE IF EXISTS SESSION02;
CREATE DATABASE SESSION02;
USE SESSION02;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    fullName VARCHAR(50) NOT NULL
);

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL
);
CREATE TABLE Score (
    student_id INT,
    subject_id INT,
    diem_qua_trinh FLOAT,
    diem_cuoi_ky FLOAT,
    PRIMARY KEY (student_id, subject_id),
    CHECK (diem_qua_trinh BETWEEN 0 AND 10),
    CHECK (diem_cuoi_ky BETWEEN 0 AND 10)
);
ALTER TABLE Score ADD CONSTRAINT fk_score_student FOREIGN KEY (student_id) REFERENCES Students(student_id);
ALTER TABLE Score ADD CONSTRAINT fk_score_subject FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id);
