-- 1. Количество исполнителей в каждом жанре
SELECT g.name, COUNT(ag.artist_id) AS artist_count
FROM Genres g
LEFT JOIN ArtistGenres ag ON g.id = ag.genre_id
GROUP BY g.name
ORDER BY artist_count DESC;

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.id) AS track_count
FROM Tracks t
JOIN Albums a ON t.album_id = a.id
WHERE a.year BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков по каждому альбому
SELECT a.title, AVG(t.duration) AS avg_duration
FROM Albums a
JOIN Tracks t ON a.id = t.album_id
GROUP BY a.title
ORDER BY avg_duration DESC;

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.name
FROM Artists ar
WHERE ar.id NOT IN (
    SELECT aa.artist_id
    FROM AlbumArtists aa
    JOIN Albums al ON aa.album_id = al.id
    WHERE al.year = 2020
);

-- 5. Названия сборников, в которых присутствует конкретный исполнитель (например, Eminem)
SELECT DISTINCT c.title
FROM Compilations c
JOIN TrackCompilations tc ON c.id = tc.compilation_id
JOIN Tracks t ON tc.track_id = t.id
JOIN Albums a ON t.album_id = a.id
JOIN AlbumArtists aa ON a.id = aa.album_id
JOIN Artists ar ON aa.artist_id = ar.id
WHERE ar.name = 'Eminem';
