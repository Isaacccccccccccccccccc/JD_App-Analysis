#计算各价值分均值，作为价值分层依据

SELECT
	AVG(R_value) AS avg_R_value,
	AVG(F_value) AS avg_F_value,
	AVG(M_value) AS avg_M_value
FROM RFM_Value
