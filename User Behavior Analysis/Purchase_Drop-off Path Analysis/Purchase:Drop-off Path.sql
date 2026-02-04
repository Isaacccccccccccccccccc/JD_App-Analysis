-- Path Analysis

Select
	-- expose quantity
	Count(Distinct Case when behavior_expo = 'expo' then uid end)
		as expo_qty,
    -- expose -> drop-off
    Count(Distinct Case when behavior_expo = 'expo' and behavior_cl is Null and behavior_cart is Null and behavior_buy is Null then uid end)
		as expo_dropoff,
    -- expose -> buy
    Count(Distinct Case when behavior_expo = 'expo' and behavior_cl is Null and behavior_cart is Null and behavior_buy = 'buy' then uid end)
		as expo_buy,
    -- expose -> cart -> drop-off
    Count(Distinct Case when behavior_expo = 'expo' and behavior_cl is Null and behavior_cart = 'cart' and behavior_buy is Null then uid end)
		as expo_cart_dropoff,
    -- expose -> cart -> buy
	Count(Distinct Case when behavior_expo = 'expo' and behavior_cl is Null and behavior_cart = 'cart' and behavior_buy = 'buy' then uid end)
		as expo_cart_buy,
    -- expose -> click -> drop-off
    Count(Distinct Case when behavior_expo = 'expo' and behavior_cl = 'cl' and behavior_cart is Null and behavior_buy is Null then uid end)
		as expo_cl_dropoff,
    -- expose -> click -> buy
    Count(Distinct Case when behavior_expo = 'expo' and behavior_cl = 'cl' and behavior_cart is Null and behavior_buy = 'buy' then uid end)
		as expo_cl_buy,
	-- expose -> click -> cart -> drop-off
    Count(Distinct Case when behavior_expo = 'expo' and behavior_cl = 'cl' and behavior_cart = 'cart' and behavior_buy is Null then uid end)
		as expo_cl_cart_dropoff,
	-- expose -> click -> cart -> buy
    Count(Distinct Case when behavior_expo = 'expo' and behavior_cl = 'cl' and behavior_cart = 'cart' and behavior_buy = 'buy' then uid end)
		as expo_cl_cart_buy
from jdsearch;