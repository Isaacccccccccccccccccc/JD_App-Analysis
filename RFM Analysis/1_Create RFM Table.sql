-- Create Table

Create table if not exists jd_RFM as
Select
	uid,
    Datediff('2022-06-05', Max(dt)) as R,
    Count(skuId) as F,
    Sum(price) as M
from jdsearch
Where behavior_buy  = 'buy'
Group by uid;

SELECT * FROM PortfolioProject.jd_RFM;