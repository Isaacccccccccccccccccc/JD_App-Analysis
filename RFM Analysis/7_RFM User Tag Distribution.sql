Select user_tag, Count(user_tag)
from jd_RFM_score_tag
Group by user_tag
Order by 1;