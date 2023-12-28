SELECT
    n.nid,
    n.primaryName AS director_name,
    COUNT(DISTINCT p.tid) AS movie_count
FROM
    names n
JOIN
    principals p ON n.nid = p.nid
JOIN
    titles t ON p.tid = t.tid
WHERE
    p.category = 'director'
    AND t.titleType = 'movie'
GROUP BY
    n.nid, n.primaryName
ORDER BY
    movie_count DESC
LIMIT 25;
