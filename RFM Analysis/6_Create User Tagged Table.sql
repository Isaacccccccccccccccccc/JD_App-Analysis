-- Create Table

Create table if not exists jd_RFM_score_tag as
Select
	uid,
	R,
	F,
	M,
    R_score,
    F_score,
    M_score,
    Case
		When R_score > 2.5562 and F_score > 1.0159 and M_score > 1.5892 then 'High-value Customers'
        When R_score > 2.5562 and F_score > 1.0159 and M_score < 1.5892 then 'Regular-value Customers'
		When R_score > 2.5562 and F_score < 1.0159 and M_score > 1.5892 then 'High-potential Customers'
        When R_score > 2.5562 and F_score < 1.0159 and M_score < 1.5892 then 'Regular-Potential Customers'
        When R_score < 2.5562 and F_score > 1.0159 and M_score > 1.5892 then 'High-priority Retention Customers'
        When R_score < 2.5562 and F_score > 1.0159 and M_score < 1.5892 then 'Regular Retention Customers'
        When R_score < 2.5562 and F_score < 1.0159 and M_score > 1.5892 then 'High-Priority Win-back Customers'
        When R_score < 2.5562 and F_score < 1.0159 and M_score < 1.5892 then 'Regular Win-back Customers'
	End as user_tag
from jd_RFM_score;

Select * from jd_RFM_score_tag;
        