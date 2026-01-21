SELECT
    SUM(expo) AS 浏览量,
    SUM(click) AS 点击量,
    SUM(cart) AS 加购量,
    SUM(buy) AS 购买量
FROM (
    SELECT
        uid,
        skuId,
        MAX(CASE WHEN behavior_expo='expo' THEN 1 ELSE 0 END) AS expo,
        MAX(CASE WHEN behavior_cl='cl' THEN 1 ELSE 0 END) AS click,
        MAX(CASE WHEN behavior_cart='cart' THEN 1 ELSE 0 END) AS cart,
        MAX(CASE WHEN behavior_buy='buy' THEN 1 ELSE 0 END) AS buy
    FROM jd_events
    GROUP BY uid, skuId
) t;

