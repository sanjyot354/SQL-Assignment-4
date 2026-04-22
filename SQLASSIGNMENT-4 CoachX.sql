
--SQL ASSIGNMENTS:-
USE SHIVAJI_University;
--1.Create Student Table:-
CREATE TABLE Students (
StudentsId INT NOT NULL PRIMARY KEY,
Name VARCHAR (100),
Surname VARCHAR (100),
BirthDate DATE,
Gender VARCHAR (10),
Class VARCHAR (20),
Point INT 
);

--2.Create Authors Table:-
CREATE TABLE Authors(
AuthorId INT NOT NULL PRIMARY KEY ,
Name VARCHAR (100),
Surname VARCHAR (100)
);

--3.Create Types Table :-
CREATE TABLE Types(
TypeId INT NOT NULL PRIMARY KEY ,
Name VARCHAR (100));

--4.Create Books Table :-
CREATE TABLE Books (
BookId INT NOT NULL PRIMARY KEY,
Name VARCHAR (100),
PageCount INT,
Point INT ,
AuthorId INT ,
TypeId INT 
FOREIGN KEY (AuthorId) REFERENCES Authors (AuthorId),
FOREIGN KEY (TypeId) REFERENCES Types(TypeId)
);

--5.Create Borrows Table:-
CREATE TABLE Borrows (
    BorrowsId INT NOT NULL PRIMARY KEY,
    StudentsId INT,
    BookId INT,
    TakenDate DATE,
    BroughtDate DATE,
    FOREIGN KEY (StudentsId) REFERENCES Students(StudentsId),
    FOREIGN KEY (BookId) REFERENCES Books(BookId)
);

--Insert Records Student Table:-
INSERT INTO students (StudentsId, name, surname, birthdate, gender, class, point)
VALUES 
(1, 'John', 'Doe', '2005-01-15', 'M', '10A', 85), 
(2, 'Jane', 'Smith', '2006-03-22', 'F', '10B', 90), 
(3, 'Alice', 'Johnson', '2005-07-12', 'F', '10A', 88), 
(4, 'Bob', 'Brown', '2006-11-30', 'M', '10C', 76), 
(5, 'Charlie', 'Davis', '2005-05-05', 'M', '10B', 92), 
(6, 'Diana', 'Miller', '2006-06-25', 'F', '10C', 81), 
(7, 'Eve', 'Wilson', '2005-09-18', 'F', '10A', 87), 
(8, 'Frank', 'Moore', '2006-12-02', 'M', '10B', 80), 
(9, 'Grace', 'Taylor', '2005-04-17', 'F', '10C', 83), 
(10, 'Hank', 'Anderson', '2006-10-20', 'M', '10A', 78); 

--Insert Record Authors Table :-
INSERT INTO authors (authorId, name, surname)
VALUES 
(1, 'F. Scott', 'Fitzgerald'), 
(2, 'Harper', 'Lee'), 
(3, 'George', 'Orwell'), 
(4, 'Jane', 'Austen'), 
(5, 'J.D.', 'Salinger'), 
(6, 'J.R.R.', 'Tolkien'), 
(7, 'Herman', 'Melville'), 
(8, 'Leo', 'Tolstoy'), 
(9, 'James', 'Joyce'), 
(10, 'Homer', '');

--Insert Record Types Table:-
INSERT INTO types (typeId, name)
VALUES 
(1, 'Fiction'), 
(2, 'Classic'), 
(3, 'Dystopian'), 
(4, 'Literature'), 
(5, 'Fantasy'), 
(6, 'Adventure'), 
(7, 'Historical Fiction'), 
(8, 'Science Fiction'), 
(9, 'Mythology'), 
(10, 'Philosophy');

--Insert Into Books:-
INSERT INTO books (bookId, name, pagecount, point, authorId, typeId) 
VALUES 
(1, 'The Great Gatsby', 180, 95, 1, 1), 
(2, 'To Kill a Mockingbird', 281, 90, 2, 2), 
(3, '1984', 328, 88, 3, 3), 
(4, 'Pride and Prejudice', 279, 93, 4, 4), 
(5, 'The Catcher in the Rye', 214, 85, 5, 1), 
(6, 'The Hobbit', 310, 91, 6, 2), 
(7, 'Moby-Dick', 635, 80, 7, 3), 
(8, 'War and Peace', 1225, 92, 8, 4), 
(9, 'Ulysses', 730, 89, 9, 1), 
(10, 'The Odyssey', 541, 87, 10, 2); 

--Insert Records Borrows Table:-
INSERT INTO borrows (BorrowsId, StudentsId, bookId, takenDate, broughtDate) 
VALUES 
(1, 1, 3, '2024-01-10', '2024-01-20'), 
(2, 2, 5, '2024-01-12', '2024-01-22'), 
(3, 3, 7, '2024-01-15', '2024-01-25'), 
(4, 4, 2, '2024-01-18', '2024-01-28'), 
(5, 5, 1, '2024-01-20', '2024-01-30'), 
(6, 6, 4, '2024-01-22', '2024-02-01'), 
(7, 7, 6, '2024-01-24', '2024-02-03'), 
(8, 8, 8, '2024-01-26', '2024-02-05'), 
(9, 9, 10, '2024-01-28', '2024-02-07'), 
(10, 10, 9, '2024-01-30', '2024-02-09'); 

--Assignments Questions 
--Example 1:  List all the records in the student table.
SELECT * FROM Students;

--Example 2: List the name surname and class of the student in the student table.
SELECT Surname,Class 
FROM Students;

--Example 3: List the gender Female (F) records in the student table.
SELECT * FROM Students
WHERE Gender='F';

--Example 4 : List the names of each class in the way of being seen once in the student table.
SELECT DISTINCT Class
FROM Students;

--Example 5: List the students with Female gender and the class 10A in the student table 
SELECT * FROM Students
WHERE  Gender='F' AND Class ='10A';

/*Example 6: List the names, surnames and classes of the students in the class 10A or 10C in 
the student table.*/
SELECT Name ,Surname ,Class 
FROM Students
WHERE Class ='10A' OR Class='10C';

--Example 7: List the students name surname and school number in the student table.
SELECT StudentsId ,Name , Surname 
FROM Students;

--Example 8: List the students name and surname by combining them as name surname in the student table
SELECT CONCAT (Name, ' ' , Surname ) AS FullName 
FROM Students;

--Example 9: List the students with the names starting with “A” letter in the student table .
SELECT * FROM Students
WHERE Name LIKE 'A%';

--Example 10: List the book names and pages count with number of pages between 50 and 200 in the book table.
SELECT Name , PageCount 
FROM Books
WHERE  PageCount BETWEEN 50 AND 200;

--Example 11: List the students with names Emma Sophia and Robert in the student table .
SELECT * FROM Students
WHERE Name = 'Emma Sophia' AND Name='Robert';

--Example 12: List the students with names starting with A D and K in the student table
SELECT * FROM Students
WHERE Name LIKE 'A%'
     OR Name LIKE 'D%'
	 OR Name LIKE 'K%';

--Example 13: List the names surnames classes and genders of males in 10A or females in 10C in the student table.
SELECT Name , Surname ,Gender, Class 
FROM Students
WHERE Gender='M' AND Class='10A'
      OR Gender='F' AND Class='10C';

--Example 14: List the males whose classes are 10B or 10C.
SELECT * FROM Students
WHERE Gender='M' AND
      Class='10B' OR Class='10C';

--Example 15: List the students with birth year 2006 in the student table.
SELECT * FROM Students
WHERE YEAR(BirthDate)=2006; 

--Example 16: List the female students with  student Points between 30 and 50;
SELECT * FROM Students
WHERE Gender='F' AND Point BETWEEN 30 AND 50

--Example 17: List the students according to their names.
SELECT StudentsId,Name
FROM Students;

--Example 18: List the students by names for those with same names. List them by their surnames.


--Example 19: List the students in 10Math by decreasing school numbers.


--Example 20: List the first 10 records in the student chart.
SELECT TOP 10 StudentsId ,Name 
FROM Students;

/*Example 21: List the first 10 records name surname and date of birth information in the 
student table.*/
SELECT TOP 10 Name,Surname ,BirthDate
FROM Students;

--Example 22: List the book with the most page number.
SELECT Name,MAX(PageCount)  AS MaxPagecount
FROM Books
GROUP BY Name;

--Example 23: List the youngest student in the student table.
SELECT * FROM Students
WHERE BirthDate =(SELECT MAX(BirthDate) FROM Students);

--Example 24: List the oldest student in the 10Math class.
SELECT * FROM Students
WHERE BirthDate =( SELECT MIN(BirthDate) FROM Students);

--Example 25: List the books with the second letter N .
SELECT * FROM Books
WHERE Name LIKE '_B%';

--Example 26: List the students by grouping according to their classes .
SELECT Class , COUNT(*) AS TOTALStudents
FROM Students
GROUP BY Class;

--Example 27: List the students to be different in each questioning randomly .
SELECT * FROM Students
ORDER BY NEWID ();

--Example 29: Bring some random student’s name , surname and number from class 10A.
SELECT Name, Surname ,Class FROM Students
WHERE Class='10A'
ORDER BY NEWID();

--Example 30: Add the writer named Smith Allen to the authors table.
INSERT INTO Authors(AuthorId,Name,Surname)
VALUES (11,'Smith','Allen');

SELECT * FROM Authors

--Example 33: Add a random student in the students chart to the writers chart as an authors.
INSERT INTO Authors (AuthorId, Name, Surname)
SELECT TOP 1 
    (SELECT ISNULL(MAX(AuthorId), 0) + 1 FROM Authors), 
    Name, Surname
FROM Students
ORDER BY NEWID();

--Example 34: Add students with student Points between 10 and 30 as authors. 
INSERT INTO Authors(Name,Surname)
SELECT Name,Surname
FROM Students
WHERE Point BETWEEN 10 AND 30;

/*Example 35: Add the writer named Cindy Brown and make him write his writer number (Note: The last 
increased rate in automatic enhancing is hold in  
@@IDENTITY factor)*/
INSERT INTO Authors(AuthorId,Name,Surname)
VALUES (13,'Cindy','Brown');

--Example 36: Change the class of the student whose StudentsId is 3 from 10C to 10A.
UPDATE Students
SET Class='10C'
WHERE StudentsId=3 
AND Class='10A';

SELECT * FROM Students;

--Example 37: Transfer all the students in 10C Class to 10A Class. 
UPDATE Students
SET Class='10A'
WHERE Class='10C';

--Example 38: Increase all of the students’ score by 5 points.
SELECT Name,Point+ 5 AS INCREASES_MARK
FROM Students;

--Example 39: Delete the author #25.
