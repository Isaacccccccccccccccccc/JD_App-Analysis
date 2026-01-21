SELECT
    dt,
    COUNT(DISTINCT uid) AS dau
FROM jd_events
GROUP BY dt
ORDER BY dt;
