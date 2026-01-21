SELECT
    c.dt1                                         AS 首日日期,
    COUNT(DISTINCT c.uid1)                        AS 首日用户量,

    COUNT(DISTINCT IF(DATEDIFF(c.dt2, c.dt1) = 1,  c.uid1, NULL)) AS 次日用户数,
    COUNT(DISTINCT IF(DATEDIFF(c.dt2, c.dt1) = 2,  c.uid1, NULL)) AS 第二日用户数,
    COUNT(DISTINCT IF(DATEDIFF(c.dt2, c.dt1) = 3,  c.uid1, NULL)) AS 第三日用户数,
    COUNT(DISTINCT IF(DATEDIFF(c.dt2, c.dt1) = 4,  c.uid1, NULL)) AS 第四日用户数,
    COUNT(DISTINCT IF(DATEDIFF(c.dt2, c.dt1) = 5,  c.uid1, NULL)) AS 第五日用户数,
    COUNT(DISTINCT IF(DATEDIFF(c.dt2, c.dt1) = 6,  c.uid1, NULL)) AS 第六日用户数,
    COUNT(DISTINCT IF(DATEDIFF(c.dt2, c.dt1) = 7,  c.uid1, NULL)) AS 第七日用户数,
    COUNT(DISTINCT IF(DATEDIFF(c.dt2, c.dt1) = 8,  c.uid1, NULL)) AS 第八日用户数,
    COUNT(DISTINCT IF(DATEDIFF(c.dt2, c.dt1) = 9,  c.uid1, NULL)) AS 第九日用户数,
    COUNT(DISTINCT IF(DATEDIFF(c.dt2, c.dt1) = 10, c.uid1, NULL)) AS 第十日用户数,
    COUNT(DISTINCT IF(DATEDIFF(c.dt2, c.dt1) = 11, c.uid1, NULL)) AS 第十一日用户数

FROM
(
    -- c 这张表是 “首日用户 a” 和 “之后仍然活跃的同一用户 b” 的所有组合
    SELECT
        a.dt  AS dt1,   -- 首日
        a.uid AS uid1,  -- 首日用户
        b.dt  AS dt2,   -- 之后活跃的日期
        b.uid AS uid2
    FROM
    (
        -- a：每一天的活跃用户（以浏览 expo 作为活跃）
        SELECT
            dt,
            uid
        FROM jd_events
        WHERE dt BETWEEN '2022-05-25' AND '2022-06-05'
          AND behavior_expo = 'expo'
        GROUP BY dt, uid
    ) a
    LEFT JOIN
    (
        -- b：同样是活跃用户，只是用来找 “之后有没有再来”
        SELECT
            dt,
            uid
        FROM jd_events
        WHERE dt BETWEEN '2022-05-25' AND '2022-06-05'
          AND behavior_expo = 'expo'
        GROUP BY dt, uid
    ) b
    ON a.uid = b.uid          -- 同一个用户
   AND a.dt < b.dt            -- b 是 a 之后的日期
) c
GROUP BY
    c.dt1
ORDER BY
    c.dt1;
