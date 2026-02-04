-- Key Behavior Funnel

Select
	Count(Distinct Case when behavior_expo = 'expo' then uid end) expo_qty,
    Count(Distinct Case when behavior_cl = 'cl' then uid end) cl_qty,
    Count(Distinct Case when behavior_cart = 'cart' then uid end) cart_qty,
    Count(Distinct Case when behavior_buy = 'buy' then uid end) buy_qty
from jdsearch;