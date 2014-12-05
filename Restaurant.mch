MACHINE			Restaurant(maxprice)

SEES			Dish

SETS			RESTAURANTS; RESTNAMES; RESTADDRESSES

VARIABLES		restaurants, address, rnames, prices, rdishes, rIsVegetarian

INVARIANT			
				restaurants <: RESTAURANTS &
				rdishes: restaurants <-> DISHES & 
				address : restaurants --> RESTADDRESSES & 		
				rnames : restaurants --> RESTNAMES &			
				prices : rdishes --> 0..maxprice &			
				!(rr).(rr : dom(rdishes) => (card({rr}<|rdishes)) : 5..15) &
				rIsVegetarian : restaurants --> BOOLTF

INITIALISATION    restaurants := {} || rdishes:= {} || address := {} || rnames:= {} || 
                  prices:= {} || rIsVegetarian:= {}
    
CONSTRAINTS    maxprice: NAT
				

OPERATIONS	
				newRestaurantRest(rr, name, addr, list) =
					PRE 	rr: RESTAURANTS
							& rr /: restaurants
							& name : RESTNAMES
							& addr : RESTADDRESSES
							& list : DISHES <-> NAT
							& !(dd).((dd : dom(list)) => dd : DISHES)
							& !(pp).((pp : ran(list)) => pp : 0..maxprice)  	
							& card(list): 5..15    
									
					THEN
							restaurants:= restaurants \/ {rr} ||
							rnames:= rnames <+ {rr |->name} ||
							address:= address <+ {rr |->addr} ||					
							rdishes:= rdishes <+ {rr} * dom(list) ||
							
							prices:= prices <+ {xx,yy,zz | xx,yy:rdishes & yy,zz:list} ||   
							rIsVegetarian:= rIsVegetarian <+ {rr|->false}					
					END;
			
				
			
				addDishToRestaurant(rr,dd,pp) =
					PRE	rr: restaurants
							& dd: DISHES
							& pp: 0..maxprice
							& (((!(rr).((rr:restaurants) => card({rr}<|rdishes) < 15) ) & 
							(dd /:ran( {rr} <| rdishes ) ))or (dd :ran( {rr} <| rdishes ) ))
					THEN	
							IF		dd :ran( {rr} <| rdishes )
							
							THEN		prices(rr,dd) := pp
							
							ELSE	
									rdishes:= rdishes <+ {rr |-> dd} ||   
									prices(rr,dd) := pp
							END
							
					END;
					
				removeDishFromRestaurant(rr, dd) =
					PRE	  rr: restaurants &
							  dd: DISHES &
							  !(rr).((rr:restaurants) => card({rr}<|rdishes) > 5) &
							  dd : ran( {rr} <| rdishes )
					
	            THEN	
	                 rdishes:=  rdishes|>>{dd}   ||   
						   prices:=  {rr|->dd} <<|  prices
					END;
				

						
				changePrice(rr,dd,pp) = 
				
				PRE 
				    rr: restaurants &
				    dd: DISHES &
				    rr |-> dd : rdishes&
					 pp : 0..maxprice
				THEN
					prices(rr,dd) := pp
				END;
				
				
				

				pp <-- getDishPrice(rr, dd) =
				PRE rr |-> dd : rdishes
				THEN
					pp := prices(rr,dd)
				END;
				

				bb <-- isVegetarianRestaurant(rr) =
				PRE rr : restaurants
				THEN
					bb := rIsVegetarian(rr)
				END;
				
					
				setVegetarianRestaurant(rr, bb) =
				PRE  rr : restaurants &
					  bb : BOOLTF &
					  ((bb = true  &
					  !(dd) . (dd:ran( {rr}<|rdishes ) => isVegetarian(dd)=true)) 
			        or bb= false ) 
					 
					
				THEN  
						rIsVegetarian(rr) := bb
					 
				END;
				
				

				name <-- getRestaurantName(rr) =
				PRE rr : restaurants
				THEN
					name := rnames(rr)
				END;
				

				addr <-- getRestaurantAddress(rr) =
				PRE 	rr : restaurants
				THEN
						addr := address(rr)
				END;

				lrr <-- getRestaurantsDish(dd) =            
				
				PRE		dd : DISHES
				THEN	
						lrr :=ran(dom( (rdishes |> {dd}) ) <| rnames)
				END;


				ldd <-- getDishRestaurant(rr) =
				PRE 	rr : restaurants
				
				THEN	 ldd := {rr} <| rdishes
				
				END
				
				
END





