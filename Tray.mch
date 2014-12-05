MACHINE		Tray

SEES		Restaurant,Dish		

SETS		TRAYS; STATUS = {OPEN,CLOSED,PAID}; CLIENTS		

VARIABLES	tdishes, tclient, tstatus, trays, tprice

INVARIANT	trays <: TRAYS &
			tdishes: trays <-> DISHES &		   
			tclient: trays --> CLIENTS &
			tstatus: trays --> STATUS	&
			tprice: trays --> NAT	
			
INITIALISATION	tdishes := {} || tclient:= {} || tstatus:= {} || trays:= {} || tprice:= {}
				
OPERATIONS	
				newTrayRest(tr,cc)=
					PRE		tr: TRAYS &
					        cc: CLIENTS
					
					THEN	trays := trays \/ {tr}	||
							tstatus:= tstatus <+ {tr |->OPEN} ||
							tclient:= tclient <+ {tr |-> cc}	
					
					END;
				
				
				
				addDishToTray(tr,dd)=
				
					PRE		tr : trays &
							dd : dishes & 
							dd : ran(rdishes) &
							tstatus(tr) = OPEN	&
							dd /: ran( {tr} <| tdishes )
							
					THEN	tdishes:= tdishes <+ {tr |-> dd}
					
					END;
							
				
				
				removeDishFromTray(tr,dd)=
				
					PRE		tr : trays &
							dd : dishes &  
							dd : ran({tr} <| tdishes) &
							tstatus(tr) = OPEN
					
					THEN	 tdishes:=  tdishes  |>> {dd}
					
					END;
					
				checkOutTray(tr) =
					
					PRE		tr : trays &
							tstatus(tr) = OPEN
					
					THEN	tstatus(tr) :=CLOSED
					
					END;
				
				
				
				payTray(tr) =
				
					PRE		tr : trays	&
							tstatus(tr) = CLOSED
					
					THEN tprice(tr):= SIGMA(dish).(dish : ran({tr} <| tdishes)  | min(  //compute price
	     {rprice|!(rr).(rr:restaurants => rprice = prices(rr,dish))} )) ||
							tstatus(tr):= PAID
					
					END;
					
					
				cancelTray(tr) =
				
					PRE		( tstatus(tr) = CLOSED) or (tstatus(tr) = OPEN) &
					        tr: TRAYS
					
					THEN	
							trays := trays - {tr}	||		
							tdishes:={tr} <<| tdishes	 ||
							tstatus:={tr} <<| tstatus	 ||
							tclient:= {tr} <<| tclient ||
							tprice:= {tr} <<| tprice		
							
					END;
					
				pp<--computePriceOfTray(tr) = 
					
					PRE	pp : NAT &
						    tr: trays
					
	THEN	pp:= SIGMA(dish).(dish : ran({tr} <| tdishes)  | min(
	     {rprice|!(rr).(rr:restaurants => rprice = prices(rr,dish))} ))
					
					END
				

END