CREATE TABLE IF NOT EXISTS RFM_Value AS
SELECT 
    uid,
    R,
    F,
    M,
    
    -- R 评分
    CASE
        WHEN R = 1 THEN 5
        WHEN R BETWEEN 2 AND 3 THEN 4
        WHEN R BETWEEN 4 AND 5 THEN 3
        WHEN R BETWEEN 6 AND 8 THEN 2
        WHEN R BETWEEN 9 AND 11 THEN 1
        ELSE 1
    END AS R_value,

    -- F 评分
    CASE
        WHEN F > 6 THEN 5
        WHEN F BETWEEN 5 AND 6 THEN 4
        WHEN F BETWEEN 3 AND 4 THEN 3
        WHEN F = 2 THEN 2
        WHEN F = 1 THEN 1
        ELSE 1
    END AS F_value,

    -- M 评分
    CASE
        WHEN M > 10000 THEN 5
        WHEN M BETWEEN 5001 AND 10000 THEN 4
        WHEN M BETWEEN 1001 AND 5000 THEN 3
        WHEN M BETWEEN 500 AND 1000 THEN 2
        WHEN M < 500 THEN 1
        ELSE 1
    END AS M_value

FROM user_rfm;

