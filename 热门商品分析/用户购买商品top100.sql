# 用户购买商品top100
SELECT
	skuid as 商品sku,
	COUNT(1) num
FROM jd_events
WHERE dt BETWEEN '2022-05-25' AND '2022-06-05'
	AND behavior_buy='buy'
GROUP BY skuid
ORDER BY num DESC 
limit 100