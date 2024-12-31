-- question 1


create table Coded.Student
(
id int primary key identity (1,1) not null,
name nvarchar(50) not null,

age int not null,
email nvarchar(50) not null
)



CREATE TABLE Coded.Courses 
( CourseID INT PRIMARY KEY identity (1,1) not null,
CourseName NVARCHAR(50) not null,
StudentID INT not null,
FOREIGN KEY (StudentID) REFERENCES Coded.Student(ID) );


--- QUESTION 2
insert into Coded.Student
values('mohammad',27,'M@OUTLOOK.COM'),
('ali',30,'A@GMAIL.COM'),
('hassan',35,'H@HOTMAIL.COM')

select * from Coded.Student


--QUESTION 3

insert into Coded.Courses
values('MATH',1),
('IT',2),
('PE',2),
('SCIENCE',3),
('HISTORY',3)

select * from Coded.Courses

--Question 4

SELECT Coded.Student.name, Coded.Courses.CourseName
FROM  Coded.Courses INNER JOIN
       Coded.Student ON Coded.Courses.StudentID = Coded.Student.id

--Question 5

UPDATE Coded.Student
SET email = 'mohammad@outlook.com'
WHERE name = 'mohammad';
select * from Coded.Student


--Question 6

delete Coded.Courses
where StudentID=1
select  * from Coded.Courses

--Question 7
alter table Coded.Student
add gender nvarchar(50) ;

select  * from Coded.Student


--Question 8

UPDATE Coded.Student
SET gender = 'male'
WHERE name = 'mohammad';

UPDATE Coded.Student
SET gender = 'male'
WHERE name = 'ali';

UPDATE Coded.Student
SET gender = 'female'
WHERE name = 'hassan';

select  * from Coded.Student


-- Question 9


SELECT Coded.Student.name, COUNT(Coded.Courses.CourseID) AS CourseCount
FROM Coded.Courses
INNER JOIN Coded.Student ON Coded.Courses.StudentID = Coded.Student.id
GROUP BY Coded.Student.id, Coded.Student.name;


-- question 10

select * from Coded.Student

WHERE name like '[M,m]%'

-- question 11

select upper(name) as 'NAME:' from Coded.Student


-- Question 12

select lower(CourseName) as 'Course Name:' from Coded.Courses

-- question 13

SELECT s.name,s.age,s.id,s.email , c.CourseName
FROM  Coded.Courses as c INNER JOIN
       Coded.Student as s ON c.StudentID = s.id


-- question 14
insert into Coded.Student
values('sara',70,'n@GMAIL.COM','female')
select * from Coded.Student

-- question 14
insert into Coded.Courses
values('MATH',4),('PE',4)
select * from Coded.Courses

--question 15
SELECT * FROM Coded.Student
WHERE age = (SELECT MIN(age) FROM Coded.Student);

--question 16
DELETE FROM Coded.Courses
WHERE StudentID = (SELECT ID FROM Coded.Student WHERE name = 'ali');

DELETE FROM Coded.Student
WHERE name = 'ali';


SELECT Coded.Student.name, Coded.Courses.CourseName
FROM  Coded.Courses INNER JOIN
       Coded.Student ON Coded.Courses.StudentID = Coded.Student.id


--Question 17
SELECT CourseName FROM Coded.Courses 
ORDER BY CourseName ASC;

-- question 18

create  proc Coded.sp_DisplayStudents

AS


SELECT Coded.Student.name, Coded.Courses.CourseName
FROM  Coded.Courses INNER JOIN
       Coded.Student ON Coded.Courses.StudentID = Coded.Student.id

EXEC Coded.sp_DisplayStudents

--question 19
create  proc Coded.sp_DisplayStudentsid
@StudentID INT
AS


SELECT Coded.Student.name, Coded.Courses.CourseName
FROM  Coded.Courses INNER JOIN
       Coded.Student ON Coded.Courses.StudentID = Coded.Student.id
	   WHERE Student.id= @StudentID


EXEC Coded.sp_DisplayStudentsid @StudentID=3



-- bonus
CREATE TABLE Coded.Enrollment
(
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Coded.Student(id),
    FOREIGN KEY (CourseID) REFERENCES Coded.Courses(CourseID)
);

-- 
INSERT INTO Coded.Enrollment (StudentID, CourseID)
VALUES 
    (3, 4),  
    (3, 5),  
    (4, 6),  
    (4, 7);  


SELECT Coded.Student.Name, 
    COUNT(Coded.Enrollment.CourseID) AS CourseCount
FROM Coded.Student
JOIN Coded.Enrollment ON Coded.Student.ID = Coded.Enrollment.StudentID
GROUP BY Coded.Student.Name
having COUNT(Coded.Enrollment.CourseID) > 1;






