CREATE TABLE IF NOT EXISTS RFM_Value_tag AS
select
	uid, R, F, M, R_value, F_value, M_value,
    case
		when R_value > 2.5562 AND F_value > 1.0228 AND M_value > 1.5892 Then '重要价值用户'
		when R_value > 2.5562 AND F_value > 1.0228 AND M_value <= 1.5892 Then '一般价值用户'
		when R_value > 2.5562 AND F_value <= 1.0228 AND M_value > 1.5892 Then '重要发展用户'
		when R_value > 2.5562 AND F_value <= 1.0228 AND M_value <= 1.5892 Then '一般发展用户'
		when R_value <= 2.5562 AND F_value > 1.0228 AND M_value > 1.5892 Then '重要保持用户'
		when R_value <= 2.5562 AND F_value > 1.0228 AND M_value <= 1.5892 Then '一般保持用户'
		when R_value <= 2.5562 AND F_value <= 1.0228 AND M_value > 1.5892 Then '重要挽留用户'
		when R_value <= 2.5562 AND F_value <= 1.0228 AND M_value <= 1.5892 Then '一般挽留用户'
    END AS uid_value
from RFM_Value