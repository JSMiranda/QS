MACHINE				Rest

INCLUDES			Dish, Tray, Restaurant

SETS				TOKENS : NAT    

VARIABLES			tDish, tRestaurant, tTray

INVARIANT			tDish : DISH &
					tRestaurant : RESTAURANTS &
					tTray: TRAYS
					
INITIALISATION		
					//operaçoes iguais é p fazer promote
					//comportamento dos tokens ta mal é preciso enviar os tokens dos DISHES, RESTAURANTS E ViCE VERSA, escolher um token aleatorio
OPERATIONS		
					newDish(name,desc,bool) = 
					
						PRE
					
						THEN
								//newDishRest(token,name,desc,bool) ||
								//token := token + 1   ta mal
						END;
					
					removeDish(dd) =
					
						PRE
					
						THEN
								removeDish(dd)
					
						END;
					
					name<--getDishName(dd) =
					
						PRE
					
						THEN name:= getDishName(dd)
					
						END;
					
					desc<--getDishDescription(dd) = 
					
						PRE
					
						THEN desc:= getDishDescription(dd)
					
						END;
					
					bb<--isVegetarianDish(dd) =
					
						PRE
					
						THEN bb:=isVegetarianDish(dd)
					
						END;
					
					newRestaurant(name,addr,list) =
					
						PRE
					
						THEN	//newRestaurantRest(token,name,addr,list) ||
								//token := token +1
						END;
					
					addDishToRestaurant(rr,dd,pp) =
					
						PRE
						
						THEN	addDishToRestaurantt(rr,dd,pp)
					
						END;
						
					removeDishFromRestaurant(rr,dd) =
					
						PRE
						
						THEN	removeDishFromRestaurant(rr,dd)
					
						END;
					
					changePrice(rr,dd,pp) =
					
						PRE
						
						THEN	changePrice(rr,dd,pp)
					
						END;
						
					pp<--getDishPrice(rr,dd) =
						PRE
						
						THEN	pp:= getDishPriceRest(rr,dd)
					
						END;
						
					setVegetarianRestaurant(rr,bb) =
					
						PRE
						
						THEN	setVegetarianRestaurant(rr,bb)
					
						END;
					
					res<--isVegetarianRestaurant(rr) =
						PRE
						
						THEN 	res:= isVegetarianRestaurant(rr)
					
						END;
						
					name<--getRestaurantName(rr)=
						PRE
						
						THEN	name:=	getRestaurantName(rr)
					
						END;
						
					addr<--getRestaurantAdress(rr)=
						PRE
						
						THEN	addr:=getRestaurantAdress(rr)
					
						END;
						
					lrr<--getRestaurantDish(rr)=
						PRE
						
						THEN	lrr:= getRestaurantDish(rr)
					
						END;
					
					ldd<--getDishRestaurant(rr)=
						PRE
						
						THEN	ldd:=getDishRestaurant(rr)
					
						END;
						
					newTray(cc)=
						PRE
						
						THEN	//newTrayRest(token,cc) ||
								//token := token + 1
					
						END;
					
					addDishTOTray(tr,dd)=
						PRE
						
						THEN	addDishTOTray(tr,dd)
					
						END;
					
					removeDishFromTray(tr,dd)=
						PRE
						
						THEN	removeDishFromTray(tr,dd)
					
						END;
						
					checkOutTray(tr)=
						PRE
						
						THEN	checkOutTray(tr)
					
						END;
						
					payTray(tr)=
						PRE
						
						THEN	payTray(tr)
					
						END;
						
					cancelTray(tr)=
						PRE
						
						THEN	cancelTray(tr)
					
						END;
					
					pp<--computePriceOfTray(tr)=
						PRE
						
						THEN	pp := computePriceOfTray(tr)
					
						END
						
END
					
						
						
					
					
			
					