WITH user_sku AS (
    SELECT
        uid,
        skuId,
        MAX(CASE WHEN behavior_expo  = 'expo'  THEN 1 ELSE 0 END) AS expo,
        MAX(CASE WHEN behavior_cl    = 'cl'    THEN 1 ELSE 0 END) AS clk,
        MAX(CASE WHEN behavior_cart  = 'cart'  THEN 1 ELSE 0 END) AS cart,
        MAX(CASE WHEN behavior_buy   = 'buy'   THEN 1 ELSE 0 END) AS buy
    FROM jd_events
    WHERE dt BETWEEN '2022-05-25' AND '2022-06-05'
    GROUP BY uid, skuId
)

SELECT
    -- 所有“至少浏览过一次”的用户-商品数量
    COUNT(*) AS 浏览起点总数,

    -- 1. 浏览 -> 流失（只浏览，没有点击、加购、购买）
    SUM(CASE
            WHEN expo = 1 AND clk = 0 AND cart = 0 AND buy = 0
            THEN 1 ELSE 0 END
    ) AS 浏览至流失人数,

    -- 2. 浏览 -> 购买（无点击、无加购，直接从浏览到购买）
    SUM(CASE
            WHEN expo = 1 AND clk = 0 AND cart = 0 AND buy = 1
            THEN 1 ELSE 0 END
    ) AS 浏览至购买人数,

    -- 3. 浏览 -> 加购 -> 购买（加购、购买都有，但没有点击）
    SUM(CASE
            WHEN expo = 1 AND clk = 0 AND cart = 1 AND buy = 1
            THEN 1 ELSE 0 END
    ) AS 浏览至加购至购买人数,

    -- 4. 浏览 -> 加购 -> 流失（加购了，但最终没买）
    SUM(CASE
            WHEN expo = 1 AND clk = 0 AND cart = 1 AND buy = 0
            THEN 1 ELSE 0 END
    ) AS 浏览至加购至流失人数,

    -- 5. 浏览 -> 点击 -> 流失（点击了，但没加购也没买）
    SUM(CASE
            WHEN expo = 1 AND clk = 1 AND cart = 0 AND buy = 0
            THEN 1 ELSE 0 END
    ) AS 浏览至点击至流失人数,

    -- 6. 浏览 -> 点击 -> 购买（点击+购买，没有加购）
    SUM(CASE
            WHEN expo = 1 AND clk = 1 AND cart = 0 AND buy = 1
            THEN 1 ELSE 0 END
    ) AS 浏览至点击至购买人数,

    -- 7. 浏览 -> 点击 -> 加购 -> 流失（点击+加购，但没买）
    SUM(CASE
            WHEN expo = 1 AND clk = 1 AND cart = 1 AND buy = 0
            THEN 1 ELSE 0 END
    ) AS 浏览至点击至加购至流失人数,

    -- 8. 浏览 -> 点击 -> 加购 -> 购买（全链路走完）
    SUM(CASE
            WHEN expo = 1 AND clk = 1 AND cart = 1 AND buy = 1
            THEN 1 ELSE 0 END
    ) AS 浏览至点击至加购至购买人数

FROM user_sku
WHERE expo = 1;     -- 只看“有过浏览”的路径
