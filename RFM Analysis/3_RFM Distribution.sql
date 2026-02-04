-- R Distribution

Select R, Count(uid) from jd_RFM
Group by R
Order by R;


-- F Distribution

Select F, Count(uid) from jd_RFM
Group by F
Order by F;


-- M Distribution

Select
	Count(Case when M < 500 then M end) as 'Under 500',
	Count(Case when M between 500 and 999 then M end) as '500-1k',
	Count(Case when M between 1000 and 4999 then M end) as '1k-5k',
	Count(Case when M between 5000 and 10000 then M end) as '5k-10k',
	Count(Case when M > 10000 then M end) as '10k+'
from jd_RFM;
        