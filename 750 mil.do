clear
cd "C:\Users\juanm\Desktop\Videos\750 mil"
use "esi-2024"

*4.3%

gen ingreso2028=ing_t_p*(1.043)^4

gen fact_cal_esi_round=round(fact_cal_esi)

hist ingreso2028 if ocup_ref==1 & ingreso2028<2000000 & ocup_form==1 [w=fact_cal_esi_round] ///
	, xline(600000) freq
	
gen diferencia=600000-ingreso2028 if ocup_form==1 & ocup_ref==1

gen dif_exp = diferencia * fact_cal_esi if diferencia > 0
egen totalgasto = total(dif_exp)
gen totalgasto_anual_miles = totalgasto * 12 / 1000
di totalgasto_anual_miles

2.452.000.000
