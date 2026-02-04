-- Daily Active Users

Select dt, Count(Distinct uid) as DAU from jdsearch
Group by dt;

Select dt, Count(Distinct uid) as DAU from jdsearch
Where behavior_expo = 'expo'
Group by dt;

Select dt, Count(Distinct uid) as DAU from jdsearch
Where behavior_cl = 'cl'
Group by dt;

Select dt, Count(Distinct uid) as DAU from jdsearch
Where behavior_cart = 'cart'
Group by dt;

Select dt, Count(Distinct uid) as DAU from jdsearch
Where behavior_buy = 'buy'
Group by dt;


Select a.dt, a.DAU as expo_DAU, b.DAU as cl_DAU, c.DAU as cart_DAU, d.DAU as buy_DAU
from (
	Select dt, Count(Distinct uid) as DAU from jdsearch
	Where behavior_expo = 'expo'
	Group by dt
) a
join (
	Select dt, Count(Distinct uid) as DAU from jdsearch
	Where behavior_cl = 'cl'
	Group by dt
) b
on a.dt = b.dt
join (
	Select dt, Count(Distinct uid) as DAU from jdsearch
	Where behavior_cart = 'cart'
	Group by dt
) c
on a.dt = c.dt
join (
	Select dt, Count(Distinct uid) as DAU from jdsearch
	Where behavior_buy = 'buy'
	Group by dt
) d
on a.dt = d.dt
Order by 1;


