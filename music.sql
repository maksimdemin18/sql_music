-- 1. Таблица жанров
CREATE TABLE Genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE CHECK (LENGTH(name) > 0) -- названия жанров не могут повторяться и не может быть пустой строкой.
);

-- 2. Таблица исполнителей
CREATE TABLE Artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE CHECK (LENGTH(name) > 0) --  имена исполнителей уникальны и не может быть пустым.
);

-- 3. Связь M:N между артистами и жанрами
CREATE TABLE ArtistGenres (
    artist_id INT REFERENCES Artists(id) ON DELETE CASCADE, -- при удалении исполнителя или жанра автоматически удаляются связанные записи.
    genre_id INT REFERENCES Genres(id) ON DELETE CASCADE, -- при удалении исполнителя или жанра автоматически удаляются связанные записи.
    PRIMARY KEY (artist_id, genre_id)
);

-- 4. Таблица альбомов
CREATE TABLE Albums (
    id SERIAL PRIMARY KEY,                      
    title VARCHAR(255) NOT NULL CHECK (LENGTH(title) > 0), 
    year INT NOT NULL CHECK (year >= 1900), -- Год выпуска не ранее 1900
    UNIQUE (title, year) -- Уникальность связки название и год
);

-- 5. Связь M:N между альбомами и артистами
CREATE TABLE AlbumArtists (
    album_id INT REFERENCES Albums(id) ON DELETE CASCADE, -- при удалении альбома или исполнителя автоматически удаляются связанные записи.
    artist_id INT REFERENCES Artists(id) ON DELETE CASCADE, -- при удалении альбома или исполнителя автоматически удаляются связанные записи.
    PRIMARY KEY (album_id, artist_id)
);

-- 6. Таблица треков
CREATE TABLE Tracks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL CHECK (LENGTH(name) > 0), 
    duration INT NOT NULL CHECK (duration > 0), -- длительность трека должна быть положительной.
    album_id INT NOT NULL REFERENCES Albums(id) ON DELETE CASCADE, --  при удалении альбома удаляются все связанные треки.
    UNIQUE (name, album_id) -- Один трек не может повторяться в альбоме
);

-- 7. Таблица сборников
CREATE TABLE Compilations (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL CHECK (LENGTH(title) > 0),
    year INT NOT NULL CHECK (year >= 1900), -- год выпуска не может быть раньше 1900.
    UNIQUE (title, year) -- уникальная комбинация названия и года.
);

-- 8. Связь M:N между треками и сборниками
CREATE TABLE TrackCompilations (
    track_id INT REFERENCES Tracks(id) ON DELETE CASCADE,
    compilation_id INT REFERENCES Compilations(id) ON DELETE CASCADE,
    PRIMARY KEY (track_id, compilation_id)
);