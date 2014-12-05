MACHINE				Rest

INCLUDES			Dish, Tray, Restaurant(20)	    

VARIABLES			tDish, tRestaurant, tTray

INVARIANT			tDish <: DISHES &
					   tRestaurant <: RESTAURANTS &
					   tTray <: TRAYS &
					   ran(rdishes)= dishes &
					   ran(tdishes)=dishes
					   
					  
					  
					
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
						 dd /: ran(tdishes)
					THEN
						removeDishRest(dd)
					END;
					


END
					
			
			
					
					
			
					