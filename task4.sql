-- 1. Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT a.title
FROM Albums a
JOIN AlbumArtists aa ON a.id = aa.album_id
JOIN Artists ar ON aa.artist_id = ar.id
JOIN ArtistGenres ag ON ar.id = ag.artist_id
GROUP BY a.title, ar.id
HAVING COUNT(ag.genre_id) > 1;

-- 2. Наименования треков, которые не входят в сборники
SELECT t.name
FROM Tracks t
LEFT JOIN TrackCompilations tc ON t.id = tc.track_id
WHERE tc.track_id IS NULL;

-- 3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT ar.name
FROM Artists ar
JOIN AlbumArtists aa ON ar.id = aa.artist_id
JOIN Tracks t ON aa.album_id = t.album_id
WHERE t.duration = (SELECT MIN(duration) FROM Tracks);

-- 4. Названия альбомов, содержащих наименьшее количество треков
SELECT a.title
FROM Albums a
JOIN Tracks t ON a.id = t.album_id
GROUP BY a.id, a.title
HAVING COUNT(t.id) = (
    SELECT COUNT(t2.id) AS track_count
    FROM Albums a2
    JOIN Tracks t2 ON a2.id = t2.album_id
    GROUP BY a2.id
    ORDER BY track_count ASC
    LIMIT 1
);
