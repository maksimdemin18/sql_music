-- Вставка жанров
INSERT INTO Genres (name) VALUES 
('Rock'), ('Pop'), ('Hip-Hop'), ('Jazz'), ('Electronic'), ('Classical');

-- Вставка исполнителей
INSERT INTO Artists (name) VALUES 
('The Beatles'), ('Michael Jackson'), ('Eminem'), ('Miles Davis'), ('Daft Punk'), ('Hans Zimmer');

-- Связь исполнителей с жанрами
INSERT INTO ArtistGenres (artist_id, genre_id) VALUES 
(1, 1), (1, 2),  -- The Beatles: Rock, Pop
(2, 2),          -- Michael Jackson: Pop
(3, 3),          -- Eminem: Hip-Hop
(4, 4),          -- Miles Davis: Jazz
(5, 5), (5, 2),  -- Daft Punk: Electronic, Pop
(6, 6);          -- Hans Zimmer: Classical

-- Вставка альбомов
INSERT INTO Albums (title, year) VALUES 
('Abbey Road', 1969),
('Thriller', 1982),
('The Marshall Mathers LP', 2000),
('Kind of Blue', 1959),
('Random Access Memories', 2013),
('Interstellar OST', 2014);

-- Связь альбомов с исполнителями
INSERT INTO AlbumArtists (album_id, artist_id) VALUES 
(1, 1),  -- Abbey Road - The Beatles
(2, 2),  -- Thriller - Michael Jackson
(3, 3),  -- The Marshall Mathers LP - Eminem
(4, 4),  -- Kind of Blue - Miles Davis
(5, 5),  -- Random Access Memories - Daft Punk
(6, 6);  -- Interstellar OST - Hans Zimmer

-- Вставка треков
INSERT INTO Tracks (name, duration, album_id) VALUES 
('Come Together', 259, 1),
('Something', 182, 1),
('Thriller', 357, 2),
('Beat It', 258, 2),
('The Real Slim Shady', 284, 3),
('Stan', 404, 3),
('So What', 562, 4),
('Blue in Green', 338, 4),
('Get Lucky', 369, 5),
('Instant Crush', 337, 5),
('Cornfield Chase', 138, 6),
('No Time for Caution', 456, 6),
('My Generation', 227, 1),
('My Way', 275, 3);

-- Вставка сборников
INSERT INTO Compilations (title, year) VALUES 
('Greatest Hits of 70s', 2018),
('Pop Classics', 2019),
('Hip-Hop Essentials', 2020),
('Jazz Masters', 2017),
('Electronic Vibes', 2018),
('Film Scores', 2020),
('Best of 80s', 2019),
('Legendary Albums', 2018),
('My Favorite Songs', 2021),
('Timeless Music', 2020);

-- Связь треков со сборниками
INSERT INTO TrackCompilations (track_id, compilation_id) VALUES 
(1, 1), (1, 8),
(2, 1),
(3, 2), (3, 7), (3, 8),
(4, 2), (4, 7),
(5, 3), (5, 9),
(6, 3),
(7, 4), (7, 8),
(8, 4),
(9, 2), (9, 5),
(10, 5),
(11, 6), (11, 10),
(12, 6),
(13, 1),
(14, 3), (14, 9);
