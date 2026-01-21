SET @max_dt := (SELECT MAX(dt) FROM jd_events);

CREATE TEMPORARY TABLE user_rfm AS
SELECT
	uid,
	DATEDIFF(@max_dt, MAX(dt)) AS R,
	COUNT(skuId) AS F,
	SUM(price) AS M
FROM	jd_events
WHERE	behavior_buy = "buy"
GROUP BY uid;

