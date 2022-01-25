-- CREATE DATABASE Cinema

-- USE Cinema

-- CREATE TABLE Halls(
--     Id INT PRIMARY KEY IDENTITY,
--     Name NVARCHAR (30)
-- )

-- CREATE TABLE Movies(
--     Id INT PRIMARY KEY IDENTITY,
--     Name NVARCHAR (30)
-- )

-- CREATE TABLE Genres(
--     Id INT PRIMARY KEY IDENTITY,
--     Name NVARCHAR (30)
-- )

-- CREATE TABLE Actors(
--     Id INT PRIMARY KEY IDENTITY,
--     Fullname NVARCHAR (30)
-- )

-- CREATE TABLE Customers(
--     Id INT PRIMARY KEY IDENTITY,
--     Fullname NVARCHAR (30)
-- )

-- CREATE TABLE Sessions(
--     Id INT PRIMARY KEY IDENTITY,
--     SessionStart DATETIME DEFAULT GETDATE(),
--     SessionEnd DATETIME DEFAULT GETDATE(),
--     MovieId INT REFERENCES Movies(Id),
--     HallId INT REFERENCES Halls(Id)
-- )

-- CREATE TABLE Tickets(
--     Id INT PRIMARY KEY IDENTITY,
--     Price INT NOT NULL,
--     HallId INT REFERENCES Halls(Id),
--     MovieId INT REFERENCES Movies(Id),
--     GenreId INT REFERENCES Genres(Id),
--     SessionId INT REFERENCES Sessions(Id),
--     CustomerId INT REFERENCES Customers(Id)
-- )

-- CREATE TABLE ActorMovies(
--     Id INT PRIMARY KEY IDENTITY,
--     ActorId INT REFERENCES Actors(Id),
--     MovieId INT REFERENCES Movies(Id)
-- )

-- CREATE TABLE GenreMovies(
--     Id INT PRIMARY KEY IDENTITY,
--     GenreId INT REFERENCES Genres(Id),
--     MovieId INT REFERENCES Movies(Id)
-- )

-- INSERT INTO Tickets
-- VALUES (7, 1,3, 2, 1, 2),
--         (5, 2,4, 1, 2, 4),
--         (12, 3,5, 4, 3, 5),
--         (7, 5,2, 4, 5, 1)

-- INSERT INTO Halls
-- VALUES ('Jupiter'),
--         ('Saturn'),
--         ('Earth'),
--         ('Venus'),
--         ('Uranus')

-- INSERT INTO Movies
-- VALUES ('Red Notice'),
--         ('Rose Island'),
--         ('The Tomorrow War'),
--         ('Infinite'),
--         ('Matrix')

-- INSERT INTO Genres
-- VALUES ('Drama'),
--         ('Comedy'),
--         ('Detective'),
--         ('Romance'),
--         ('Science')

-- INSERT INTO Actors
-- VALUES ('Bradt Pitt'),
--         ('Chriss Pratt'),
--         ('Dwayne Jhonson'),
--         ('Jamie Foxx'),
--         ('Vin Diesel')

-- INSERT INTO Customers
-- VALUES ('Aydin Yusubov'),
--         ('Samir Yusifov'),
--         ('Islam Abdullayev'),
--         ('Orxan Orucov'),
--         ('Kamran Ismayilov')

-- INSERT INTO ActorMovies
-- VALUES  (1, 3),
--         (2, 5),
--         (3, 2),
--         (4, 1),
--         (5, 4)

-- INSERT INTO GenreMovies
-- VALUES  (1, 2),
--         (2, 3),
--         (2, 1),
--         (4, 5),
--         (5, 4)

-- INSERT INTO Sessions
-- VALUES (12-20, 14-20, 1, 1),
--         (12-20, 14-20, 3, 2),
--         (12-20, 14-20, 4, 3),
--         (12-20, 14-20, 2, 4),
--         (12-20, 14-20, 5, 5)

SELECT Fullname 'Actor', Name 'Movie' FROM Actors a
JOIN ActorMovies am
ON a.Id = am.ActorId
JOIN Movies m
ON m.Id = am.MovieId 

SELECT m.Name 'Movie Name', g.Name 'Genre Name' FROM Genres g
JOIN GenreMovies gm
ON g.Id = gm.GenreId
JOIN Movies m
ON m.Id = gm.MovieId

SELECT h.Name 'Hall Name',m.Name 'Movie Name', SessionStart, SessionEnd FROM Movies m
JOIN Sessions s
ON m.Id = s.MovieId
JOIN Halls h
ON h.Id = s.HallId


-- CREATE VIEW v_GetTicketInfo
-- AS
-- SELECT Price, SessionStart, SessionEnd, m.Name 'Movie', g.Name 'Genre',h.Name 'Hall', Fullname 'Customer'  FROM Movies m

-- JOIN Tickets t
-- ON m.Id = t.MovieId

-- JOIN Genres g
-- ON g.Id = t.GenreId

-- JOIN Sessions s
-- ON s.Id = t.SessionId

-- JOIN Halls h
-- ON h.Id = s.HallId

-- JOIN Customers c
-- ON c.Id = t.CustomerId

SELECT * FROM v_GetTicketInfo