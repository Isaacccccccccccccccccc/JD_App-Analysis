-- Create Table

Create table if not exists jd_RFM_score as
Select
	uid,
	R,
	F,
	M,
	Case
		When R = 1 then 5
		When R between 2 and 3 then 4
		When R between 4 and 5 then 3
		When R between 6 and 8 then 2
		When R between 9 and 11 then 1
        Else 1
	End as R_score,
	Case
		when F > 6 then 5
		When F between 5 and 4 then 4
		When F between 3 and 2 then 3
		When F = 2 then 2
		When F = 1 then 1
        Else 1
	End as F_score,
	Case
		When M > 10000 then 5
		When M between 5001 and 10000 then 4
		When M between 1001 and 5000 then 3
		When M between 500 and 1000 then 2
		When M < 500 then 1
        Else 1
	End as M_score
from jd_RFM;

Select * from jd_RFM_score;
            