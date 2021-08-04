-- Database creation
CREATE DATABASE IF NOT EXISTS Studio;

USE Studio;

CREATE TABLE Copyright_books (
    Book_id INT AUTO_INCREMENT PRIMARY KEY,
	Title VARCHAR(50) NOT NULL,
    Auteur VARCHAR(30) NOT NULL,
    Year INT NOT NULL,
    Copies_sold INT CHECK (Copies_sold>=0) NOT NULL,
    Price FLOAT(2) CHECK (Price>0.00) NOT NULL 
);

INSERT INTO Studio.Copyright_books (Title, Auteur, Year, Copies_sold, Price) VALUES
('The Shining','Stephen King',1977,1070000,7.99), 
('The Lord of the Rings','J. R. R. Tolkien',1954 ,150000,7.99), 
('A Clockwork Orange','Anthony Burges',1962,700800,7.99), 
('Dangerous Liaisons','Laclos',1782,985000,1.99), 
('The Green Mile','Stephen King',1965,850000,7.99), 
('Pride and Prejudice','Jane Austen',1813,2500000,8.50), 
('Misery','Stephen King',1977,354500,4.50), 
('Jurassic Park','Michael Crichton',1990,750670,4.99), 
('Lolita','Vladimir Nabokov',1955,6050000,2.50), 
('The Hunger Games','Suzanne Collins',2008,3000000,9.99), 
('Trainspotting','Irvine Welsh',1993,450000,6.99), 
('Charlie and the Chocolate Factory','Roald Dahl',1964,4050600,5.99), 
('Gone Gril','Gillian Flynn',2012,160000,12.99), 
('Sense and Sensibility','Jane Austen',1811,1000000,7.99), 
('Alice in Wonderland','Lewis Carol',1865,5500000,2.99), 
('The Name of the Rose','Umberto Eco',1980,900800,1.89),  
('Dracula','Bram Stoker',1897,105400,3.49); 

CREATE TABLE Teams ( 
    Team_id INT AUTO_INCREMENT PRIMARY KEY,
    Office VARCHAR(30) NOT NULL
);

INSERT INTO Studio.Teams (Office) VALUES
('LA'),
('Paris'),
('London'),
('LA');

CREATE TABLE Employees ( 
    Employee_id INT AUTO_INCREMENT PRIMARY KEY,
    Team_id INT,
    Employee_name VARCHAR(50) NOT NULL,
    Job_title VARCHAR(50) NOT NULL,
    FOREIGN KEY (Team_id) REFERENCES Teams(Team_id)
);

INSERT INTO Studio.Employees (Team_id, Employee_name, Job_title) VALUES
(1,'Bob' ,'Director of Photography'),
(1,'Hannah' ,'Chef Operator'),
(1,'Sarah' ,'Productor'),
(1,'John' ,'Assistant'),
(1,'Max' ,'Assistant'),
(1,'Dany' ,'Movie Editor'),
(2,'Mary' ,'Assistant'),
(2,'Lara' ,'Chef Operator'),
(2,'John' ,'Movie Editor'), -- different person i.e id different
(3,'Monica','Chef Operator'),
(3,'Jennifer' ,'Makeup Artist'),
(3,'Lisa' ,'Costume Designer'),
(3,'Jessica' ,'Assistant'),
(4,'James','Director of Photography'),
(4,'Tom' ,'Makeup Artist'),
(4,'Josh' ,'Assistant'),
(4,'Emma' ,'Costume Designer');

CREATE TABLE Adaptation_projects (
	Project_id INT AUTO_INCREMENT PRIMARY KEY,
    Book_id INT,
    Project_title VARCHAR(50) NOT NULL,
    Budget INT CHECK (Budget>0) NOT NULL,
    Filming_location VARCHAR(50) NOT NULL,
    Starting_date DATE NOT NULL,
    End_date DATE NOT NULL, -- assuming end = realse date
	Statut VARCHAR(30) NOT NULL DEFAULT 'Not Started', -- Not Started / In Progress / Released / Abandonned
    FOREIGN KEY (Book_id) REFERENCES Copyright_books(Book_id)
);

INSERT INTO Studio.Adaptation_projects(Book_id, Project_title, Budget, Filming_location, Starting_date, End_date, Statut) VALUES
(3,'A Clockwork Orange',1500000,'Germany','1968-11-11','1970-11-11','Released'),
(10,'Charlie',550000,'US','1969-01-10','1971-01-10','Released'),
(1,'Shining',7800000,'Canada','1978-05-03', '1980-01-10','Released'),
(14,'Sense and Sensibility',4500000,'UK','1992-10-14','1995-01-10','Released'),
(9,'Lolita',3500000,'USA','1994-07-04','1997-11-09' ,'Released'),
(5,'Green Mile',4500000,'USA', '1995-09-24','1999-11-15','Released'),
(2,'Lord of the Rings 1',45000000,'NZ','1997-12-01','2001-01-23' ,'Released'),
(2,'Lord of the Rings 3',55000000,'NZ','1999-03-16','2003-03-10' ,'Released'),
(2,'Lord of the Rings 2',65000000,'NZ','1998-04-21','2002-07-09' ,'Released'),
(12,'Charlie and the Chocolate Factory',7000000, 'UK','2000-07-23','2005-08-10','Released'),
(6,'Pride and Prejudice',3000000,'UK','2003-03-03','2005-12-15' ,'Released'),
(15,'Alice',8000000,'UK','2007-01-08','2010-05-11','Released'),
(10,'Hunger Games',12000000,'USA','2010-11-22','2012-04-19','Released'),
(13,'Gone Gril',15000000,'USA','2012-02-03','2014-08-22','Released');

INSERT INTO Studio.Adaptation_projects (Book_id, Project_title, Budget, Filming_location, Starting_date, End_date, Statut) VALUES
(1,'The Shining',56000000,'USA','2015-03-21','2016-02-03','Abandonned'), 
(4,'Dangerous Liaisons',34000000,'France','2018-02-03','2021-07-14','In Progress'),
(7,'Misery',15800000,'USA','2019-02-03','2021-12-03','In Progress'), 
(8,'Jurassic Park',215000000,'USA','2019-02-03','2022-07-03','In Progress'), 
(9,'Lolita',25007000,'USA','2022-02-13' ,'2024-12-03','Not Started'),
(17,'Dracula',58700000,'UK','2021-06-16','2022-11-18','In Progress'); 

CREATE TABLE Films_released(
	Film_id INT AUTO_INCREMENT PRIMARY KEY, 
	Project_id INT,
	Title VARCHAR(50) NOT NULL,
    Director VARCHAR(30) NOT NULL,
    Year_release YEAR NOT NULL,
    Box_Office INT  DEFAULT 0,
	FOREIGN KEY (Project_id) REFERENCES Adaptation_projects(Project_id)
);

INSERT INTO Studio.Films_released (Project_id, Title, Director, Year_release, Box_Office) VALUES
(3,'The Shining','Stanley Kubrick',1980,8000000),
(7,'The Lord of the Rings: The Fellowship of the Ring','Peter Jackon',2001 ,8900000),
(8,'The Lord of the Rings: The Return of the King','Peter Jackon',2003 ,6050050),
(9,'The Lord of the Rings: The Two Towers','Peter Jackon',2002 ,3005000),
(1,'A Clockwork Orange','Stanley Kubrick',1971,2500000),
(6,'The Green Mile','Frank Darabont', 1999,6000000),
(11,'Pride and Prejudice','Joe Wright', 2005,195000),
(5,'Lolita','Stanley Kubrick',1997 ,1000000),
(13,'The Hunger Games','Gary Ross',2012,1000000),
(10,'Charlie and the Chocolate Factory','Tim Burton',2005 ,1568000),
(2,'Charlie and the Chocolate Factory','Muel Stuart',1971 ,1000000),
(14,'Gone Gril','David Fincher',2014,1000000),
(4,'Sense and Sensibility','Ang Lee',1995,1000000),
(12,'Alice in Wonderland','Tim Burton',2010,1000000);

INSERT INTO Studio.Films_released (Project_id , Title, Director, Year_release) VALUES
(16,'Dangerous Liaisons','Paul Riley',2021),
(17,'Misery','Rob Reiner',2021), 
(18,'Jurassic Park','Sid Scott',2022), 
(19,'Lolita','Janne Doe',2024),
(20,'Dracula','John Doe',2022); 

CREATE TABLE Team_projects (
    Project_id INT,
    Team_id INT,
    FOREIGN KEY (Project_id) REFERENCES Adaptation_projects(Project_id),
	FOREIGN KEY (Team_id) REFERENCES Teams(Team_id)
);

INSERT INTO Studio.Team_projects(Project_id, Team_id) VALUES
(1,4),
(2,3),
(3,1),
(4,3),
(5,4),
(6,1),
(7,1),
(8,1),
(9,1),
(7,4),
(8,4),
(9,4),
(10,3),
(11,2),
(12,3),
(13,1),
(14,4),
(15,2),
(16,2),
(17,4),
(18,1),
(18,4),
(19,2),
(20,3);

CREATE TABLE Reviewers (
    Reviewer_id INT AUTO_INCREMENT PRIMARY KEY,
    Reviewer_name VARCHAR(50) NOT NULL UNIQUE,
    Reviewer_type VARCHAR(50) NOT NULL
);

INSERT INTO Studio.Reviewers(Reviewer_name, Reviewer_type) VALUES
('The New York Time','Press'), 
('The Guardian','Press'),
('Rotten Tomatoes','Website'), 
('IMDb','Website');

CREATE TABLE Reviews (
    Review_id INT AUTO_INCREMENT PRIMARY KEY,
    Film_id INT,
    Reviewer_id INT,
    Rating INT CHECK(Rating >=1 AND Rating<=5), 
    FOREIGN KEY (Film_id) REFERENCES Films_released(Film_id),
    FOREIGN KEY (Reviewer_id) REFERENCES Reviewers(Reviewer_id)
);

INSERT INTO Studio.Reviews(Film_id, Reviewer_id, Rating) VALUES
(1,1,5), 
(1,2,5),
(2,4,5), 
(2,1,4), 
(2,2,4),
(3,1,3), 
(3,2,4),
(3,3,5), 
(3,4,5),
(4,3,4), 
(4,4,4),
(5,1,2),
(5,2,4),
(6,1,3),
(6,2,4),
(6,4,5),
(7,2,3),
(7,3,3),
(7,4,3),
(8,2,4),
(8,1,3),
(9,2,2),
(9,3,3),
(9,4,3),
(10,2,2),
(10,4,3),
(12,2,4),
(12,4,5),
(12,2,4),
(13,2,2),
(13,3,2),
(14,2,2),
(14,4,3);

CREATE TABLE Genres (
    Genre_id INT AUTO_INCREMENT PRIMARY KEY,
    Genre_description VARCHAR(20) NOT NULL UNIQUE
);
INSERT INTO Studio.Genres (Genre_description) VALUES
('Horror'),
('Fantasy'),
('Adventure'),
('Thriller'),
('Classic'),
('Historical'),
('Comedy'),
('Romance'),
('Drama'),
('Children'),
('Young Adult'),
('Muscical'),
('Moderne Classic'),
('Dystopia'),
('Action'),
('Novel'),
('Crime'),
('Sci-Fi'),
('Family'),
('War'),
('Gothic');

CREATE TABLE Genre_Films (
    Film_id INT ,
    Genre_id INT,
    FOREIGN KEY (Film_id) REFERENCES Films_released(Film_id),
    FOREIGN KEY (Genre_id) REFERENCES Genres(Genre_id)
);


INSERT INTO Studio.Genre_Films (Film_id, Genre_id) VALUES
(1,1),
(1,2),
(2,2),
(2,3),
(3,2),
(3,3),
(4,2),
(4,3),
(5,4),
(6,9),
(7,6),
(7,8),
(8, 9),
(9,15),
(9,9),
(10,12),
(11,12),
(12,4),
(13,6),
(13,8),
(14,2),
(14,3);

CREATE TABLE Genre_Books (
    Book_id INT,
    Genre_id INT,
    FOREIGN KEY (Book_id) REFERENCES Copyright_books(Book_id),
    FOREIGN KEY (Genre_id) REFERENCES Genres(Genre_id)
);

INSERT INTO Studio.Genre_Books (Book_id, Genre_id) VALUES
(1,1),
(2,2),
(2,3),
(3,4),
(4,6),
(4,8),
(5,1),
(6,9),
(6,5),
(7,1),
(8,3),
(9,16),
(10,11),
(10,14),
(11,16),
(12,10),
(13,4),
(14,5),
(14,8),
(15,10),
(16,16), 
(17,2),
(17,21);