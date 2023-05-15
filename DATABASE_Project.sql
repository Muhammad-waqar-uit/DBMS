CREATE TABLE Department(
    DepartmentNo NUMBER(4) CONSTRAINT DepartmentNo_PK PRIMARY KEY,
    DepartmentName VARCHAR2(20)
);

desc Department;
select * from Department;

CREATE TABLE Course(
    CourseID VARCHAR2(8) CONSTRAINT CourseID_PK PRIMARY KEY,
    CourseName VARCHAR2(20),
    CreditHours NUMBER(2)
);



ALTER TABLE Assignment
DROP CONSTRAINT Assignment_StudentID_FK;

drop table assignment;
drop table student;
drop table course;
drop table teacher;


/*
drop table users;
drop table courseoffering;
drop table department;





*/


CREATE TABLE CourseOffering(
    CourseID VARCHAR2(8),
    CourseName VARCHAR2(20),
    DepartmentNo NUMBER(4),
    CONSTRAINT CourseOffering_courseID_FK FOREIGN KEY(CourseID) REFERENCES Course(CourseID), 
    CONSTRAINT CourseOffering_DepartmentNo_FK FOREIGN KEY(DepartmentNo) REFERENCES Department(DepartmentNo)
);


CREATE TABLE Teacher(
    TeacherID NUMBER(4) CONSTRAINT TeacherID_PK PRIMARY KEY,
    TeacherName VARCHAR(30),
    DepartmentNo NUMBER(4),
    CourseID VARCHAR2(8),
    CONSTRAINT Teacher_DepartmentNo_FK FOREIGN KEY (DepartmentNo) REFERENCES Department(DepartmentNo),
    CONSTRAINT Teacher_CourseID_FK FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

desc teacher;



CREATE TABLE Student(
    StudentID NUMBER(4) CONSTRAINT StudentID_PK PRIMARY KEY,
    FullName VARCHAR2(40),
    Gender VARCHAR2(10),
    Email VARCHAR2(25),
    Address VARCHAR2(30),
    DOB DATE,
    Major CHAR(20),
    Semester CHAR(20),
    AdmissionDate DATE,
    CourseID VARCHAR2(8),
    CONSTRAINT Student_CourseID_FK FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);




CREATE TABLE Assignment(
  AssignmentID NUMBER(4) CONSTRAINT AssignmentID_PK PRIMARY KEY,
  Assignment1 NUMBER(3),
  Assignment2 NUMBER(3),
  TeacherID NUMBER(4),
  StudentID NUMBER(4),
  CONSTRAINT Assignment_TeacherID_FK FOREIGN KEY (TeacherID) REFERENCES Teacher(TeacherID),
  CONSTRAINT Assignment_StudentID_FK FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
desc assignment;

ALTER TABLE Assignment
DROP COLUMN StudentID;




CREATE TABLE Users(
    UserID NUMBER(4) CONSTRAINT UserID_PK PRIMARY KEY,
    Password VARCHAR2(50),
    DepartmentNo Number(4),
    CONSTRAINT Users_DepartmentNo_FK FOREIGN KEY(DepartmentNo) REFERENCES Department(DepartmentNo)
);

drop table users;
desc Users;

Alter TABLE Teacher
ADD AssignmentID NUMBER(4);

desc teacher

Alter TABLE Student
ADD AssignmentID NUMBER(4);

desc Student;

ALTER TABLE Teacher
ADD CONSTRAINT Teacher_AssignmentID_FK 
FOREIGN KEY(AssignmentID) REFERENCES Assignment(AssignmentID);



ALTER TABLE Student
ADD CONSTRAINT Student_Assignment_FK 
FOREIGN KEY(AssignmentID) REFERENCES Assignment(AssignmentID);

desc student;
desc teacher;


--------------------------
--Data Insertion

--Department Table
Insert into Department(DepartmentNo,DepartmentName)
Values(01,'Electrical');
Insert into Department(DepartmentNo,DepartmentName)
Values(02,'Computer Science');
Insert into Department(DepartmentNo,DepartmentName)
Values(03,'Power');

--Course Table
Insert into Course(CourseID,CourseName,CreditHours)
Values('CS311','Database System',04);
Insert into Course(CourseID,CourseName,CreditHours)
Values('CS312','Operating Systems',04);
Insert into Course(CourseID,CourseName,CreditHours)
Values('CS413','Information Security',03);
Insert into Course(CourseID,CourseName,CreditHours)
Values('HS252','Economics',02);
Insert into Course(CourseID,CourseName,CreditHours)
Values('HS353','Technopreneurship',02);
Insert into Course(CourseID,CourseName,CreditHours)
Values('EL301','Electronic Circuits',04);
Insert into Course(CourseID,CourseName,CreditHours)
Values('PE413','Power Protection',03);
Insert into Course(CourseID,CourseName,CreditHours)
Values('EL323','Electrical Machines',04);
Insert into Course(CourseID,CourseName,CreditHours)
Values('HS122','Pakistan Studies',02);
Insert into Course(CourseID,CourseName,CreditHours)
Values('PE444','Power System',02);

select * from course;

--CourseOffering 
Insert into CourseOffering(CourseID,CourseName,DepartmentNo)
Values('CS311','Database System',02);
Insert into CourseOffering(CourseID,CourseName,DepartmentNo)
Values('CS312','Operating Systems',02);
Insert into CourseOffering(CourseID,CourseName,DepartmentNo)
Values('CS413','Information Security',02);
Insert into CourseOffering(CourseID,CourseName,DepartmentNo)
Values('HS252','Economics',02);
Insert into CourseOffering(CourseID,CourseName,DepartmentNo)
Values('HS353','Technopreneurship',02);
Insert into CourseOffering(CourseID,CourseName,DepartmentNo)
Values('EL301','Electronic Circuits',01);
Insert into CourseOffering(CourseID,CourseName,DepartmentNo)
Values('PE413','Power Protection',03);
Insert into CourseOffering(CourseID,CourseName,DepartmentNo)
Values('EL323','Electrical Machines',03);
Insert into CourseOffering(CourseID,CourseName,DepartmentNo)
Values('HS122','Pakistan Studies',02);

select * from CourseOffering;

-----Teacher Table
Insert into Teacher(TeacherID,TeacherName,DepartmentNo,CourseID)
Values(1,'Dr Lubaid Ahmed',02,'CS311');
Insert into Teacher(TeacherID,TeacherName,DepartmentNo,CourseID)
Values(2,'Syed Faisal Ali',02,'CS312');
Insert into Teacher(TeacherID,TeacherName,DepartmentNo,CourseID)
Values(3,'Sana Sohail',01,'EL301');
Insert into Teacher(TeacherID,TeacherName,DepartmentNo,CourseID)
Values(4,'Farukh Waheed Baig',01,'PE413');
Insert into Teacher(TeacherID,TeacherName,DepartmentNo,CourseID)
Values(5,'Shehla Andleeb',01,'PE444');
Insert into Teacher(TeacherID,TeacherName,DepartmentNo,CourseID)
Values(6,'Amir Khan',02,'HS122');
Insert into Teacher(TeacherID,TeacherName,DepartmentNo,CourseID)
Values(7,'Qasim Pasta',02,'CS311');
Insert into Teacher(TeacherID,TeacherName,DepartmentNo,CourseID)
Values(8,'Adnan Ahmed',03,'HS252');
Insert into Teacher(TeacherID,TeacherName,DepartmentNo,CourseID)
Values(9,'Bilal Khan',03,'EL323');
Insert into Teacher(TeacherID,TeacherName,DepartmentNo,CourseID)
Values(10,'Hijab Saad Bari',01,'HS353');

select * from Teacher;
----Student Table
INSERT INTO Student(Studentid,fullname,gender, email, address, dob, major, semester, admissionDate, courseID)
VALUES (1,'Ahmed Raza','Male', 'AhmedRaza1@gmail.com', 'Gulshan','11-JUN-2000','Software','Five','1-JAN-2019','CS312');
INSERT INTO Student(Studentid,fullname,gender, email, address, dob, major, semester, admissionDate, courseID)
VALUES (2,'Hamza Siddiqui','Male', 'Hamza1@gmail.com', 'Johar','6-JUN-2000','Software','Five','2-JAN-2019','CS311');
INSERT INTO Student(Studentid,fullname,gender, email, address, dob, major, semester, admissionDate, courseID)
VALUES (3,'Ahmed Khan','Male', 'AhmedKhan1@gmail.com', 'Lyari','11-March-1999','Electrical','Four','5-JAN-2020','HS353');
INSERT INTO Student(Studentid,fullname,gender, email, address, dob, major, semester, admissionDate, courseID)
VALUES (4,'Muneeb Khan','Male', 'Muneeb4@gmail.com', 'NorthKarachi','1-Dec-1998','Power','Seven','1-March-2017','PE444');
INSERT INTO Student(Studentid,fullname,gender, email, address, dob, major, semester, admissionDate, courseID)
VALUES (5,'Faiza Ali','Female', 'Faiza62@gmail.com', 'DHA','15-Nov-2001','Software','Five','1-JAN-2020','HS122');
INSERT INTO Student(Studentid,fullname,gender, email, address, dob, major, semester, admissionDate, courseID)
VALUES (6,'Marium Ali','Female', 'marium19@gmail.com', 'Saddar','13-Feb-2000','Power','Five','3-Nov-2019','PE444');
INSERT INTO Student(Studentid,fullname,gender, email, address, dob, major, semester, admissionDate, courseID)
VALUES (7,'Abeer Khan','Male', 'Abeer78@gmail.com', 'MalirCantt','1-Jan-2000','Software','Five','1-JAN-2019','CS413');
INSERT INTO Student(Studentid,fullname,gender, email, address, dob, major, semester, admissionDate, courseID)
VALUES (8,'Alishba','Female', 'Alishba8@gmail.com', 'Gulshan','5-Aug-1999','Electrical','Six','1-JAN-2020','EL323');
INSERT INTO Student(Studentid,fullname,gender, email, address, dob, major, semester, admissionDate, courseID)
VALUES (9,'Waqar Ahmed','Male', 'WaqarA1@gmail.com', 'Johar','5-March-1999','Software','Four','1-JUNE-2020','HS252');
INSERT INTO Student(Studentid,fullname,gender, email, address, dob, major, semester, admissionDate, courseID)
VALUES (10,'Turaab Ali','Female', 'Turaab@gmail.com', 'Bufferzone','28-Feb-2000','Electrical','Four','28-MAR-2020','EL301');

select * from student;

----Assignment Table
INSERT INTO Assignment(assignmentID, TeacherID,StudentID, assignment1, assignment2)
VALUES (1,2,1,4,5);
INSERT INTO Assignment(assignmentID, TeacherID,StudentID, assignment1, assignment2)
VALUES (2,4,2,4,4);
INSERT INTO Assignment(assignmentID, TeacherID,StudentID, assignment1, assignment2)
VALUES (3,1,3,4,5);
INSERT INTO Assignment(assignmentID, TeacherID,StudentID, assignment1, assignment2)
VALUES (4,5,4,4,5);
INSERT INTO Assignment(assignmentID, TeacherID,StudentID, assignment1, assignment2)
VALUES (5,6,5,2,3);
INSERT INTO Assignment(assignmentID, TeacherID,StudentID, assignment1, assignment2)
VALUES (6,4,6,4,4);
INSERT INTO Assignment(assignmentID, TeacherID,StudentID, assignment1, assignment2)
VALUES (7,8,8,1,5);
INSERT INTO Assignment(assignmentID, TeacherID,StudentID, assignment1, assignment2)
VALUES (8,3,7,3,5);
INSERT INTO Assignment(assignmentID, TeacherID,StudentID, assignment1, assignment2)
VALUES (9,3,9,3,1);
INSERT INTO Assignment(assignmentID, TeacherID,StudentID, assignment1, assignment2)
VALUES (10,3,10,3,0);

select * from Assignment;

------User Table
INSERT INTO Users(userID,password, departmentNo)
VALUES (1111,'password@abc', 1);
INSERT INTO Users(userID,password, departmentNo)
VALUES (1112,'password@123', 2);
INSERT INTO Users(userID,password, departmentNo)
VALUES (1113,'wawac@password', 3);
INSERT INTO Users(userID,password, departmentNo)
VALUES (1114,'passwordHCCS123', 1);
INSERT INTO Users(userID,password, departmentNo)
VALUES (1115,'123password123',1);
INSERT INTO Users(userID,password, departmentNo)
VALUES (1116,'passWORD321123', 3);
INSERT INTO Users(userID,password, departmentNo)
VALUES (1117,'abcdefgPassword', 1);
INSERT INTO Users(userID,password, departmentNo)
VALUES (1119,'1239pass@', 2);
INSERT INTO Users(userID,password, departmentNo)
VALUES (1120,'asdfgh9@', 1);
INSERT INTO Users(userID,password, departmentNo)
VALUES (1121,'12pass@', 3);
INSERT INTO Users(userID,password, departmentNo)
VALUES (1122,'9pass@', 3);
--------------------------------
--Describe Tables
desc department;
desc course;
desc courseOffering;
desc teacher;
desc student;
desc assignment;
desc users;



----Table Projection

select * from department;



select * from course;



select * from courseOffering;



select * from teacher;




select * from student;



select * from assignment;



select * from users;




