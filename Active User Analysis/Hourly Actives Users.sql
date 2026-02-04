-- Hourly Active Users

Select dt, Hour(From_unixtime(report_ts_expo/1000)) as hour, Count(Distinct uid) as HAU
from jdsearch
Where behavior_expo = 'expo'
Group by dt, hour
Order by dt, hour;

Select dt, Hour(From_unixtime(report_ts_cl/1000)) as hour, Count(Distinct uid) as HAU
from jdsearch
Where behavior_cl = 'cl'
Group by dt, hour
Order by dt, hour;

Select dt, Hour(From_unixtime(report_ts_cart/1000)) as hour, Count(Distinct uid) as HAU
from jdsearch
Where behavior_cart = 'cart'
Group by dt, hour
Order by dt, hour;

Select dt, Hour(From_unixtime(report_ts_buy/1000)) as hour, Count(Distinct uid) as HAU
from jdsearch
Where behavior_buy = 'buy'
Group by dt, hour
Order by dt, hour;


-- HAU Per Day

Select a.dt, a.hour, a.HAU as expo_HAU, b.HAU as cl_HAU, c.HAU as cart_HAU, d.HAU as buy_HAU
from (
	Select dt, Hour(From_unixtime(report_ts_expo/1000)) as hour, Count(Distinct uid) as HAU
	from jdsearch
	Where behavior_expo = 'expo'
	Group by dt, hour
) a
join (
	Select dt, Hour(From_unixtime(report_ts_cl/1000)) as hour, Count(Distinct uid) as HAU
	from jdsearch
	Where behavior_cl = 'cl'
	Group by dt, hour
) b
on a.hour = b.hour and a.dt = b.dt
join (
	Select dt, Hour(From_unixtime(report_ts_cart/1000)) as hour, Count(Distinct uid) as HAU
	from jdsearch
	Where behavior_cart = 'cart'
	Group by dt, hour
) c
on a.hour = c.hour and a.dt = c.dt
join (
	Select dt, Hour(From_unixtime(report_ts_buy/1000)) as hour, Count(Distinct uid) as HAU
	from jdsearch
	Where behavior_buy = 'buy'
	Group by dt, hour
) d
on a.hour = d.hour and a.dt = d.dt
Order by a.hour;


-- HAU Total

Select a.hour, a.HAU as expo_HAU, b.HAU as cl_HAU, c.HAU as cart_HAU, d.HAU as buy_HAU
from (
	Select Hour(From_unixtime(report_ts_expo/1000)) as hour, Count(Distinct uid) as HAU
	from jdsearch
	Where behavior_expo = 'expo'
	Group by hour
) a
join (
	Select Hour(From_unixtime(report_ts_cl/1000)) as hour, Count(Distinct uid) as HAU
	from jdsearch
	Where behavior_cl = 'cl'
	Group by hour
) b
on a.hour = b.hour
join (
	Select Hour(From_unixtime(report_ts_cart/1000)) as hour, Count(Distinct uid) as HAU
	from jdsearch
	Where behavior_cart = 'cart'
	Group by hour
) c
on a.hour = c.hour
join (
	Select Hour(From_unixtime(report_ts_buy/1000)) as hour, Count(Distinct uid) as HAU
	from jdsearch
	Where behavior_buy = 'buy'
	Group by hour
) d
on a.hour = d.hour
Order by a.hour;




