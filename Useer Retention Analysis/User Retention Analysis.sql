-- User Retention Analysis

With a as (
	Select dt, uid from jdsearch
	Where dt between '2022-05-25' and '2022-06-05' and behavior_expo = 'expo'
	Group by dt, uid
),
b as (
	Select uid, Min(dt) as dt1 from a
	Group by uid
),
c as (
Select b.dt1, a.dt as dt2, b.uid
from b
left join a on b.uid = a.uid and b.dt1 < a.dt
)
Select 
	dt1 as cohort_date,
    Count(Distinct uid) as corhort_size,
    Count(Distinct If(Datediff(dt2, dt1) = 1, uid, Null)) as day1_retained_users,
    Count(Distinct If(Datediff(dt2, dt1) = 2, uid, Null)) as day2_retained_users,
    Count(Distinct If(Datediff(dt2, dt1) = 3, uid, Null)) as day3_retained_users,
    Count(Distinct If(Datediff(dt2, dt1) = 4, uid, Null)) as day4_retained_users,
    Count(Distinct If(Datediff(dt2, dt1) = 5, uid, Null)) as day5_retained_users,
    Count(Distinct If(Datediff(dt2, dt1) = 6, uid, Null)) as day6_retained_users,
    Count(Distinct If(Datediff(dt2, dt1) = 7, uid, Null)) as day7_retained_users,
    Count(Distinct If(Datediff(dt2, dt1) = 8, uid, Null)) as day8_retained_users,
    Count(Distinct If(Datediff(dt2, dt1) = 9, uid, Null)) as day9_retained_users,
    Count(Distinct If(Datediff(dt2, dt1) = 10, uid, Null)) as day10_retained_users,
    Count(Distinct If(Datediff(dt2, dt1) = 11, uid, Null)) as day11_retained_users
from c
Group by dt1
Order by dt1;


-- User Retetion Rate

With a as (
	Select dt, uid from jdsearch
	Where dt between '2022-05-25' and '2022-06-05' and behavior_expo = 'expo'
	Group by dt, uid
),
b as (
	Select uid, Min(dt) as dt1 from a
	Group by uid
),
c as (
Select b.dt1, a.dt as dt2, b.uid
from b
left join a on b.uid = a.uid and b.dt1 < a.dt
)
Select 
	dt1 as cohort_date,
	Concat(Count(Distinct If(Datediff(dt2, dt1) = 1, uid, NULL)) * 100.0 / Count(Distinct uid), '%') AS d1_retention_rate,
    Concat(Count(Distinct If(Datediff(dt2, dt1) = 2, uid, NULL)) * 100.0 / Count(Distinct uid), '%') AS d2_retention_rate,
    Concat(Count(Distinct If(Datediff(dt2, dt1) = 3, uid, NULL)) * 100.0 / Count(Distinct uid), '%') AS d3_retention_rate,
    Concat(Count(Distinct If(Datediff(dt2, dt1) = 4, uid, NULL)) * 100.0 / Count(Distinct uid), '%') AS d4_retention_rate,
    Concat(Count(Distinct If(Datediff(dt2, dt1) = 5, uid, NULL)) * 100.0 / Count(Distinct uid), '%') AS d5_retention_rate,
    Concat(Count(Distinct If(Datediff(dt2, dt1) = 6, uid, NULL)) * 100.0 / Count(Distinct uid), '%') AS d6_retention_rate,
    Concat(Count(Distinct If(Datediff(dt2, dt1) = 7, uid, NULL)) * 100.0 / Count(Distinct uid), '%') AS d7_retention_rate,
    Concat(Count(Distinct If(Datediff(dt2, dt1) = 8, uid, NULL)) * 100.0 / Count(Distinct uid), '%') AS d8_retention_rate,
    Concat(Count(Distinct If(Datediff(dt2, dt1) = 9, uid, NULL)) * 100.0 / Count(Distinct uid), '%') AS d9_retention_rate,
    Concat(Count(Distinct If(Datediff(dt2, dt1) = 10, uid, NULL)) * 100.0 / Count(Distinct uid), '%') AS d10_retention_rate,
    Concat(Count(Distinct If(Datediff(dt2, dt1) = 11, uid, NULL)) * 100.0 / Count(Distinct uid), '%') AS d11_retention_rate
from c
Group by dt1
Order by dt1;















