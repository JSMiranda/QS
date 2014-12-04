MACHINE				Tray

SEES		Dish, Restaurant			

SETS		TRAYS, STATUS = {OPEN,CLOSED,PAID}, CLIENTS		

VARIABLES	tdishes, tclient, tstatus, trays, tprice

INVARIANT	trays <: TRAYS &
			tdishes: trays <-> dishes &		   
			tclient: trays --> CLIENTS &
			tstatus: trays --> STATUS	&
			tprice: trays --> NAT	
			
INITIALISATION	tdishes := {}
				
OPERATIONS	
				newTrayRest(tr,cc)=
					PRE		cc: CLIENTS
					
					THEN	trays := trays \/ {tr}	||
							tstatus <+ {tr |->OPEN} ||
							tclient <+ {tr |-> cc}	||
							tprice  <+ {tr|->0}
					
					END;
				
				
				
				addDishtoTray(tr,dd)=
				
					PRE		tr : trays &
							dd : dishes &  //TODO  tem de ser um dd em rdishes
							tstatus(tr) == OPEN	&
							//TODO dd n pode estar contido nos dishes de tr
					THEN	tdishes <+ {tr |-> dd}
					
					END;
							
				
				
				removeDishFromTray(tr,dd)=
				
					PRE		tr : trays &
							dd : dishes &  //TODO apenas remover dishes q sejam da tray tr
							tstatus(tr) == OPEN
					
					THEN	 {dd} <<| tdishes  
					
					END;
					
				checkOutTray(tr) =
					
					PRE		tr : trays &
							tstatus(tr) == OPEN
					
					THEN	tstatus(tr) :=CLOSED
					
					END;
				
				
				
				payTray(tr) =
				
					PRE		tr : trays	&
							tstatus(tr) == CLOSED
					
					THEN	pp := computePriceofTrayRest(tr) ||
							tstatus <+ {tr |->PAID} ||
							tprice(tr):= pp 
					
					END;
					
					
				cancelTray(tr) =
				
					PRE		tstatus(tr)==CLOSED \/ tstatus(tr) == OPEN
					
					THEN	
							trays := trays - {tr}	||		
							{tr} <<| tdishes	||
							{tr} <<| tstatus	||
							{tr} <<| tclients	||
							{tr} <<| tprice					
					
					END;
					
					
				pp<--computePriceOfTray(tr) = 
					
					PRE	pp : NAT &
						tr: trays
					
					THEN	//TODO sum do min dos dishes de tr
					
					END
				//sigma x. (x pertence S) f(x) 
				//sigma dd . (dd pertence ldd | min (S))
				

END