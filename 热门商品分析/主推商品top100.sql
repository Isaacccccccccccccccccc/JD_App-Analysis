# 热门商品分析
# 主推商品top100

SELECT
	skuid,
	COUNT(1) num
FROM jd_events
WHERE dt BETWEEN '2022-05-25' AND '2022-06-05'
	AND behavior_expo='expo'
GROUP BY skuid
ORDER BY num DESC 
limit 100

