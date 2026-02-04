Select skuId, Count(skuId) as num
from jdsearch
Where behavior_buy = 'buy'
Group by skuId
Order by num desc
Limit 100;