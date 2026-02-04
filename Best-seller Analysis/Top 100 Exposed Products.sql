Select skuId, Count(skuId) as num
from jdsearch
Where behavior_expo = 'expo'
Group by skuId
Order by num desc
Limit 100;