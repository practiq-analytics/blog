WITH SAWITH0 
AS 
(
	select distinct ROWNUM, T418.Revenue as c1,
		T451.Prod_Dsc as c2,
		T42.Calendar_Date as c3
	from 
		BISAMPLE.SAMP_PRODUCTS_D T451 /* D10 Product (Dynamic Table) */ ,
		BISAMPLE.SAMP_TIME_DAY_D T42 /* D01 Time Day Grain */ ,
		BISAMPLE.SAMP_REVENUE_F T418 /* F10 Billed Rev */ 
	where  
	( 
		T42.Calendar_Date = T418.Bill_Day_Dt and 
		T418.Prod_Key = T451.Prod_Key 
	) 
)
select 
	D1.c1 as c1, 
	D1.c2 as c2, 
	D1.c3 as c3, 
	D1.c4 as c4 
from 
( 
	select 
		0 as c1,
		D1.c1 as c2,
		D1.c2 as c3,
		D1.c3 as c4
	from 
		SAWITH0 D1
	order by c4, c3, c2 
) D1