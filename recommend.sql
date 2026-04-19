create database movies;
use movies;
create table Users(user_id int PRIMARY KEY,name varchar(50),age int);
create table Movies(movie_id int PRIMARY KEY,title varchar(100),genre varchar(50));
create table Ratings(user_id int,movie_id int,ratings decimal(2,1),
FOREIGN KEY(user_id) REFERENCES Users(user_id),
FOREIGN KEY(movie_id) REFERENCES Movies(movie_id));
create table Watch_History(user_id int,movie_id int,watch_date DATE,
FOREIGN KEY(user_id) REFERENCES Users(user_id),
FOREIGN KEY(movie_id) REFERENCES Movies(movie_id));

insert into Users values
(1,'geetha',20),
(2,'akhila',23),
(3,'bhargavi',21),
(4,'amruta',21),
(5,'hema',21),
(6,'salwar',20);

insert into Movies values 
(101,'Julayi','action-comedy'),
(102,'Couple friendly', 'Romance'),
(103,'pokiri','action'),
(104,'Madageera','Fantasy'),
(105,'Dude','Rom-Com'),
(106,'Aravinda Sametha Veera Raghava','action'),
(107,'Maharshi','action-drama'),
(108, 'The Room', 'Drama'),
(109, 'Battlefield Earth', 'Sci-Fi'),
(110, 'Catwoman', 'Action'),
(111, 'Movie 43', 'Comedy');


INSERT INTO Ratings VALUES
(1, 101, 5),
(2, 101, 4),
(3, 101, 5),
(1, 102, 4),
(3, 102, 4),
(5, 102, 3),
(2, 103, 5),
(4, 103, 4),
(6, 103, 5),
(1, 104, 5),
(2, 104, 4),
(3, 104, 5),
(4, 105, 3),
(2, 105, 4),
(5, 105, 3),
(5, 106, 5),
(6, 106, 4),
(3, 106, 5),
(4, 107, 5),
(2, 107, 4),
(1, 107, 5),
(1, 108, 1.5),
(2, 108, 2.0),
(3, 109, 1.0),
(4, 109, 1.5),
(5, 110, 2.0),
(6, 110, 1.5),
(2, 111, 1.0),
(3, 111, 2.0);


INSERT INTO Watch_History (user_id, movie_id, watch_date) VALUES
(1, 101, '2020-01-01'),
(2, 101, '2021-01-02'),
(3, 101, '2022-01-03'),
(1, 102, '2021-02-05'),
(3, 102, '2022-02-06'),
(5, 102, '2023-02-07'),
(2, 103, '2020-03-10'),
(4, 103, '2021-03-11'),
(6, 103, '2022-03-12'),
(1, 104, '2023-04-15'),
(2, 104, '2024-04-16'),
(3, 104, '2025-04-17'),
(4, 105, '2021-05-20'),
(2, 105, '2022-05-21'),
(5, 105, '2023-05-22'),
(5, 106, '2020-06-25'),
(6, 106, '2021-06-26'),
(3, 106, '2022-06-27'),
(4, 107, '2023-07-30'),
(2, 107, '2024-07-31'),
(1, 107, '2025-08-01'),
(1, 108, '2022-08-05'),
(2, 108, '2023-08-06'),
(3, 109, '2021-09-10'),
(4, 109, '2022-09-11'),
(5, 110, '2023-10-15'),
(6, 110, '2024-10-16'),
(2, 111, '2025-11-20'),
(3, 111, '2026-11-21');

/*top-rated movies*/
select m.title ,avg(r.ratings) as avg_rating from Movies m join ratings r on m.movie_id = r.movie_id 
group by m.title order by avg_rating desc;

/*most popular genres*/
select m.genre,count(*) as total_views from Watch_History w join Movies m on w.movie_id = m.movie_id
group by m.genre 
order by total_views desc;

/*Recommend movies based on similar users*/
SELECT DISTINCT r2.movie_id
FROM Ratings r1
JOIN Ratings r2 ON r1.user_id = r2.user_id
WHERE r1.movie_id IN (
    SELECT movie_id FROM Ratings WHERE user_id = 1
)
AND r2.movie_id NOT IN (
    SELECT movie_id FROM Ratings WHERE user_id = 1
);

/*average rating per user */
select user_id,avg(ratings) as avg_rating from Ratings group by user_id;
/* most active users */
select user_id,count(*) as total_watches from Watch_History group by user_id order by total_watches desc;

/*trending movies*/
select m.title,count(*) as recent_views from Watch_History w join movies m on w.movie_id = m.movie_id
where w.watch_date >= '2022-04-30'
group by m.title
order by recent_views desc;
