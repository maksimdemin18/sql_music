-- 1. Название и продолжительность самого длительного трека
SELECT name, duration 
FROM Tracks 
ORDER BY duration DESC 
LIMIT 1;

-- 2. Название треков, продолжительность которых не менее 3,5 минут (210 секунд)
SELECT name 
FROM Tracks 
WHERE duration >= 210;

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title 
FROM Compilations 
WHERE year BETWEEN 2018 AND 2020;

-- 4. Исполнители, чьё имя состоит из одного слова
SELECT name 
FROM Artists 
WHERE name NOT LIKE '% %';

-- 5. Название треков, которые содержат слово «мой» или «my» (без учета регистра)
SELECT name 
FROM Tracks 
WHERE LOWER(name) LIKE '%мой%' OR LOWER(name) LIKE '%my%';
