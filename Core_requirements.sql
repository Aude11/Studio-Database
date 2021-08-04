USE Studio; 

-- JOINS CREATE A VIEW 
-- QUERY question : What is the genre of each movie released by the studio?

CREATE VIEW View_Film_vs_Genre
AS 
SELECT Films_released.Film_id, Films_released.Title, Genres.Genre_description
FROM Films_released
JOIN Genre_Films 
ON Films_released.Film_id = Genre_Films.Film_id
JOIN Genres
ON Genres.Genre_id = Genre_Films.Genre_id
ORDER BY Films_released.Film_id;

SELECT * FROM View_Film_vs_Genre;

-- STORED FUNCTION 
-- Stored function that calulates the number of days difference between the current date and another set dates and returns a sentence

DELIMITER //
CREATE FUNCTION days_left(date1 date) RETURNS VARCHAR(30) DETERMINISTIC
BEGIN
 DECLARE date2 DATE;
 DECLARE days INT;
 DECLARE days_left_sentence VARCHAR(30);
  SELECT  CURRENT_DATE() INTO date2;
  SET days = DATEDIFF(date1, date2);
  SET days_left_sentence = CONVERT(days, CHAR);
  SET days_left_sentence = CONCAT_WS(' ', days_left_sentence, 'days');
  RETURN days_left_sentence;
END 
//
DELIMITER ;

-- QUERY  question : How many days are left before to research the deadline of a movie project ?
SELECT Project_id, Project_title, Starting_date, End_date, days_left(End_date) AS days_before_release
FROM Adaptation_projects
WHERE Statut IN ('In Progress','Not Started');

-- STORED FUNCTION 2 : determine the quality of a movie according to this average rating from reviewer
DELIMITER //
CREATE FUNCTION is_a_good_movie(
    Rating INT
) 
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE Movie_quality VARCHAR(30);
    IF Rating > 4 THEN
        SET Movie_quality = 'Excellent';
    ELSEIF (Rating  >= 3 AND 
            Rating  <= 4) THEN
        SET Movie_quality = 'Good';
	ELSEIF (Rating  < 3  AND
			Rating > 2)THEN
        SET Movie_quality = 'Not Great';
    ELSEIF Rating  <= 2 THEN
        SET Movie_quality = 'Very Bad';
    END IF;
    RETURN (Movie_quality);
END//
DELIMITER ;

-- QUERY STORED FUNCTION 2 question: Display the avrage rating and quality of each movie
SELECT 
	Title,
    AVG(Rating) as average_rating,
    is_a_good_movie(AVG(Rating)) AS Movie_quality
FROM
    View_Film_Box_Office_vs_Rating_Team 
    GROUP BY Title;

-- SUBQUERY: Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis
-- QUERY question : which movie has a rating and box office superieur to the average and a budget inferieu to average movie

SELECT DISTINCT 
	Project_id, Film_id,  Title, Director, Year_release, Book_id, Box_Office, Budget, Filming_location, Starting_date, End_date
	FROM 
		Films_released JOIN Reviews USING (Film_id)
        JOIN Adaptation_projects USING (Project_id)
        WHERE Rating > 
        ( SELECT
			AVG (Rating)
		FROM
			Reviews
        )
        AND Budget <=
        ( SELECT
			AVG (Budget)
		FROM
			Adaptation_projects
        )
        AND Box_Office >=
        ( SELECT
			AVG (Box_Office)
		FROM
			Films_released
        );

--  STORED PROCEDURE 
DELIMITER //
CREATE PROCEDURE find_project_of_employee_by_filming_location(FirstName VARCHAR(30), Location VARCHAR(30))
BEGIN
SELECT 
		*
	FROM 
		Employees JOIN Teams USING (Team_id)
        JOIN Team_projects USING(Team_id)
        JOIN Adaptation_projects USING (Project_id)
        WHERE Employee_name = FirstName  AND Filming_location = Location ;
END //
DELIMITER ;

-- Run stored function
CALL find_project_of_employee_by_filming_location('John','Uk');
Call find_project_of_employee_by_filming_location('Emma','USA');

-- TRIGGER 
-- Assigmenet remender to add a genre fo the new movie
DELIMITER //  
CREATE TRIGGER after_insert_books 
AFTER INSERT 
ON Copyright_books FOR EACH ROW  
BEGIN  
    INSERT INTO Genre_books (Book_id, Genre_id)
    values (new.Book_id,22);
END //  
DELIMITER ; 
 
-- ACTIVATE TRIGGER 
INSERT INTO Studio.Copyright_books (Title, Auteur, Year, Copies_sold, Price) VALUES
('My new book','Myself',2021,1,7.99); 
SELECT * FROM Genre_Books WHERE Book_id = 18;

-- EVENT
SET GLOBAL event_scheduler = ON;
DELIMITER //
CREATE EVENT Every_day_statut_update
  ON SCHEDULE EVERY 1 DAY STARTS '2021-07-14 19:30:00'
  ON COMPLETION PRESERVE
DO BEGIN
  UPDATE  Adaptation_projects
  SET Statut = 'Released'
  WHERE Statut IN ('In Progress','Not Started') AND CURDATE() > END_date;
END //
DELIMITER ;

--  VIEWS WITH 4 TABLES 

CREATE VIEW View_Film_vs_Rating_by_Reviwer
AS 
SELECT Films_released.Title,Films_released.Box_Office , Reviews.Rating, Reviewers.Reviewer_name, Reviewers.Reviewer_type
FROM Films_released
JOIN Reviews
ON Films_released.Film_id = Reviews.Film_id
JOIN Reviewers
ON Reviews.Reviewer_id = Reviewers.Reviewer_id
ORDER BY Films_released.Title AND Reviewers.Reviewer_type;

-- QUERY TO USE VIEW
-- For each reviewer display the box office sum, the average box office, the max and min rating and average rating given
SELECT  Reviewer_name, Sum(Box_Office),ROUND(AVG(Box_Office), 2) ,Max(Rating),Min(Rating), ROUND(AVG(Rating), 2)
FROM View_Film_vs_Rating_by_Reviwer
Group BY Reviewer_name;

-- OTHER VIEW WITH 4 TABLES AND QUERY
CREATE VIEW View_Film_Box_Office_vs_Rating_Team
AS 
SELECT Films_released.Title,Films_released.Box_Office, Reviews.Rating, Team_projects.Team_id
FROM Films_released
JOIN Reviews
ON Films_released.Film_id = Reviews.Film_id
JOIN Adaptation_projects
ON Adaptation_projects.Project_id = Films_released.Project_id
Join Team_projects
ON Team_projects.Project_id = Adaptation_projects.Project_id 
ORDER BY Team_projects.Team_id;

-- QUERY : For each team displays the sum of box office, the average box office, the average rating obtained
SELECT Sum(Box_Office), ROUND(AVG(Box_Office), 2),Max(Rating),Min(Rating),ROUND(AVG(Rating), 2), Team_id
FROM View_Film_Box_Office_vs_Rating_Team
Group BY Team_id;

-- Query for each rating display the total sum of the box office and the average box office
SELECT Sum(Box_Office),AVG(Box_Office),Rating
FROM View_Film_Box_Office_vs_Rating_Team
Group BY Rating;

-- QUERY WITH GROUP BY AND HAVING 
SELECT 
    Auteur,
    ROUND(AVG(Copies_sold), 2) as average_copies_sold,
    ROUND(AVG(Price), 2) as average_price_auteur_books,
    ROUND(SUM(Copies_sold*0.12*Price), 2) AS Profit_amount
FROM
    Copyright_books
GROUP BY Auteur
Having AVG(Price)>5
ORDER BY Profit_amount;


