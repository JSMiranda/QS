MACHINE				Rest

INCLUDES			Dish, Tray, Restaurant(20)	    

VARIABLES			tDish, tRestaurant, tTray

INVARIANT			tDish <: DISHES &
					   tRestaurant <: RESTAURANTS &
					   tTray <: TRAYS &
					   ran(rdishes) <:dishes &
					   ran(tdishes) <:dishes &
					   
					   !(dd1, dd2, rr).(rr : restaurants & dd1:dishes & dd2:dishes & dd1 :ran({rr}<|rdishes) & dd2 : ran({rr}<|rdishes) & dd1 /= dd2 => names(dd1) /= names(dd2)) & //The dishes in the menu of a restaurant have all different names;

					   
					    !(dd, rr).(rr : restaurants & dd : dishes & dd : ran({rr}<|rdishes) & rIsVegetarian(rr)=true => isVegetarian(dd)=true) & //Vegetarian restaurants only offer vegetarian dishes;
					    
					    !(dd,tr).(tr : trays & dd : dishes & tstatus(tr) /= PAID & dd : ran({tr} <| tdishes)  => #(rr).(rr : restaurants & dd :ran({rr}<|rdishes))) //Every dish on a non-PAID tray has to be in some restaurant’s menu;
					    
					   
					
INITIALISATION tDish:= {} || tRestaurant:= {} || tTray:= {}

					
PROMOTES			getDishName, getDishDescription, isVegetarianDish,
					addDishToRestaurant, removeDishFromRestaurant, changePrice,
					getDishPrice, setVegetarianRestaurant, isVegetarianRestaurant,
					getRestaurantName, getRestaurantAddress, getRestaurantsDish,
					getDishRestaurant, addDishToTray, removeDishFromTray, payTray,
					cancelTray, computePriceOfTray
					
OPERATIONS		
					newDish(name,desc,bb) = 
					
						PRE name:NAMES &
						    desc:DESCRIPTIONS &
						    bb: BOOLTF 
						
						THEN    
						          
						    ANY     tt   
						    WHERE   tt:DISHES & tt /:tDish
						        
						    THEN    newDishRest(tt,name,desc,bb) ||
						            tDish:= tDish \/ {tt}
						    END	
						END;
					
							
					
					newRestaurant(name,addr,list) =
					
						PRE    name: RESTNAMES &
						       addr:RESTADDRESSES &
						       list : DISHES <-> NAT
					
						THEN
						        ANY     tt   
						        WHERE   tt:RESTAURANTS & tt /:tRestaurant
						        THEN    newRestaurantRest(tt,name,addr,list) ||
							             tRestaurant:= tRestaurant \/ {tt}
							     END
						  
						END;
					
					newTray(cc)=
						PRE    cc:CLIENTS
						
		                THEN	  
		                   ANY     tt   
						        WHERE   tt:TRAYS & tt /:tTray
						        THEN    newTrayRest(tt,cc) ||
							             tTray:= tTray \/ {tt}
							            
							     END
								
						END;
						
						removeDish(dd) =
					PRE dd : dishes &
						 dd /: ran(rdishes) &
						 (dd /: ran(tdishes) or  !(tr).(tr: dom(tdishes |> {dd}) => tstatus(tr) /=PAID))
					THEN
						removeDishRest(dd)
					END;
					


END
					
			
			
					
					
			
					