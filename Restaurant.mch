MACHINE			Restaurant(maxprice)

SEES			Dish

SETS			RESTAURANTS, RESTNAMES, RESTADDRESSSES

VARIABLES		restaurants, address, name, prices, rdishes, rIsVegetarian

INVARIANT
				rdishes: restaurants <-> dishes & 				
				restaurants <: RESTAURANTS &
				address : restaurants --> RESTADDRESSSES & 		
				name : restaurants --> RESTNAMES &			
				prices : rdishes --> 0..maxprice &			
				!(r).(r : dom(rdishes) => (card({r}<|rdishes)) : 5..15) &
				rIsVegetarian : restaurants --> BOOL   

INITIALISATION	restaurants := {} 
				

OPERATIONS	
				newRestaurantRest(rr, name, addr, list) =
					PRE 	rr: RESTAURANTS
							& rr /: restaurants
							& name : RESTNAMES
							& addr : RESTADRESSES
							& !(d).((d : dom(list)) => d : DISHES)
							& !(p).((p : ran(list)) => p : 0..maxprice)  	
							& card(list): 5..15    
									
					THEN
							restaurants:= restaurants \/ {rr} ||
							name <+ {rr |->name} ||
							address <+ {rr |->addr} ||					
							rdishes <+ {rr} * dom(list) ||
							prices <+ (list><rdishes~)~  ||   
							rIsVegetarian <+ {rr|->false}					
					END;
				
			
				addDishToRestaurant(rr,dd,pp) =
					PRE		rr: restaurants
							& dd: DISHES
							& pp: 0..maxprice
							& (((!(rr).((rr:restaurants) => card({rr}<|rdishes) < 15) ) & 
							(dd :/ran( {rr} <| rdishes ) )) or (dd :ran( {rr} <| rdishes ) ))
							
							
					THEN	
							IF		dd :ran( {rr} <| rdishes )
							
							THEN	changePrice(rr,dd,pp)
							
							ELSE	
									rdishes <+ {rr |-> dd} ||   
									price <+ {{rr |-> dd} |-> pp}
							
					END;
					
				removeDishFromRestaurant(rr, dd) =
					PRE		rr: restaurants
							dd: DISHES
							!(rr).((rr:restaurants) => card({rr}<|rdishes) > 5)
							dd : ran( {rr} <| rdishes )
					
					THEN	{dd} <<| rdishes  ||   
							prices |>> {dd} 
					END;
				

				changePrice(rr,dd,pp) = 
				PRE {rr |-> dd} : rdishes
					& pp : 0..maxprice
				THEN
					prices({rr |-> dd}) := pp
				END;

				pp <-- getDishPrice(rr, dd) =
				PRE {rr |-> dd} : rdishes
				THEN
					pp := prices({rr |-> dd})
				END;

				bb <-- isVegetarianRestaurant(rr) =
				PRE rr : restaurants
				THEN
					bb := rIsVegetarian(rr)
				END;
				
					
				setVegetarianRestaurant(rr, bb) =
				PRE  rr : restaurants &
					 bb : BOOL &
					 ( ( {bb} == {true}) & (!(d) . (d:ran( {rr}<|rdishes ) => isVeg(d)==true) )) or
					({bb} == {false} )  
					 
					
				THEN  
						rIsVegetarian(rr) := bb
					 
				END;
				
				

				name <-- getRestaurantName(rr) =
				PRE rr : restaurants
				THEN
					name := name(rr)
				END;

				addr <-- getRestaurantAddress(rr) =
				PRE 	rr : restaurants
				THEN
						addr := address(rr)
				END;

				lrr <-- getRestaurantsDish(dd) =            
				
				PRE		dd : DISH
				THEN	
						lrr :=ran(dom( (rdishes |> {dd}) ) <| name)
				END;


				ldd <-- getDishRestaurant(rr)  
				PRE 	rr : restaurants
				
				THEN	 ldd := rr <| rdishes
				
				END
				
				
END



// f: x -> Y   com  ran(f) = y   no rest

