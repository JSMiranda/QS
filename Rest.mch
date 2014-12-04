MACHINE				Rest

INCLUDES			Dish, Tray, Restaurant

SETS				TOKENS : NAT    

VARIABLES			tDish, tRestaurant, tTray

INVARIANT			tDish : DISH &
					tRestaurant : RESTAURANTS &
					tTray: TRAYS
					
INITIALISATION		
					
					
PROMOTES			removeDish, getDishName, getDishDescription, isVegetarianDish,
					addDishToRestaurant, removeDishFromRestaurant, changePrice,
					getDishPrice, setVegetarianRestaurant, isVegetarianRestaurant,
					getRestaurantName, getRestaurantAdress, getRestaurantDish,
					getDishRestaurant, addDishTOTray, removeDishFromTray, payTray,
					cancelTray, computePriceOfTray
					

OPERATIONS		
					newDish(name,desc,bool) = 
					
						PRE
					
						THEN
								newDishRest(token,name,desc,bool) ||
								token := token + 1   ta mal
						END;
					
							
					
					newRestaurant(name,addr,list) =
					
						PRE
					
						THEN	newRestaurantRest(token,name,addr,list) ||
								token := token +1
						END;
					
					newTray(cc)=
						PRE
						
						THEN	newTrayRest(token,cc) ||
								token := token + 1
					
						END
END
					
						
						
					
					
			
					