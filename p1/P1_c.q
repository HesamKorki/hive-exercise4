SELECT
    a1.primaryName AS actor1_name,
    a1.nid AS actor1_nid,
    a2.primaryName AS actor2_name,
    a2.nid AS actor2_nid,
    COUNT(DISTINCT m.tid) AS co_occurrence_count
FROM
    principals p1
JOIN
    principals p2 ON p1.tid = p2.tid
JOIN
    names a1 ON p1.nid = a1.nid
JOIN
    names a2 ON p2.nid = a2.nid
JOIN
    titles m ON p1.tid = m.tid
WHERE
    (p1.category IN ('actor', 'actress', 'director'))
    AND (p2.category IN ('actor', 'actress', 'director'))
    AND p1.nid < p2.nid
    AND m.titleType = 'movie'
GROUP BY
    a1.nid, a1.primaryName, a2.nid, a2.primaryName
HAVING
    co_occurrence_count > 3
ORDER BY
    co_occurrence_count DESC;
