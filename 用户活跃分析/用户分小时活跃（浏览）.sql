# 用户分小时活跃（浏览）
SELECT
    dt,
    HOUR(FROM_UNIXTIME(report_ts_expo/1000)) AS hour,
    COUNT(DISTINCT uid) AS uv
FROM jd_events
WHERE behavior_expo = 'expo'
GROUP BY dt, hour
ORDER BY dt, hour;

