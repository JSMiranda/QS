MACHINE				Rest

INCLUDES			Dish, Tray, Restaurant

SETS				TOKENS     //TODO cena do maxprice, como fica? aqui ou noutra machine á parte? penso q apenas o restaurante precisa disso

VARIABLES			tokens

INVARIANT			tokens : NAT
					
INITIALISATION		tokens := 1

OPERATIONS		
					newDish(name,desc,bool) = 
					
						PRE
					
						THEN
								newDishRest(token,name,desc,bool) ||
								token := token + 1
						END;
					
					removeDish(dd) =
					
						PRE
					
						THEN
								removeDishRest(dd)
								
					
						END;
					
					name<--getDishName(dd) =
					
						PRE
					
						THEN name:= getDishNameRest(dd)
					
						END;
					
					desc<--getDishDescription(dd) = 
					
						PRE
					
						THEN desc:= getDishDescriptionRest(dd)
					
						END;
					
					bb<--isVegetarianDish(dd) =
					
						PRE
					
						THEN bb:=isVegetarianDishRest(dd)
					
						END;
					
					newRestaurant(name,addr,list) =
					
						PRE
					
						THEN	newRestaurantRest(token,name,addr,list) ||
								token := token +1
						END;
					
					addDishToRestaurant(rr,dd,pp) =
					
						PRE
						
						THEN	addDishToRestaurantRest(rr,dd,pp)
					
						END;
						
					removeDishFromRestaurant(rr,dd) =
					
						PRE
						
						THEN	removeDishFromRestaurantRest(rr,dd)
					
						END;
					
					changePrice(rr,dd,pp) =
					
						PRE
						
						THEN	changePriceRest(rr,dd,pp)
					
						END;
						
					pp<--getDishPrice(rr,dd) =
						PRE
						
						THEN	pp:= getDishPriceRest(rr,dd)
					
						END;
						
					setVegetarianRestaurant(rr,bb) =
					
						PRE
						
						THEN	setVegetarianRestaurantRest(rr,bb)
					
						END;
					
					res<--isVegetarianRestaurantRest(rr) =
						PRE
						
						THEN 	res:= isVegetarianRestaurant(rr)
					
						END;
						
					name<--getRestaurantNameRest(rr)=
						PRE
						
						THEN	name:=	getRestaurantName(rr)
					
						END;
						
					addr<--getRestaurantAdressRest(rr)=
						PRE
						
						THEN	addr:=getRestaurantAdress(rr)
					
						END;
						
					lrr<--getRestaurantDish(rr)=
						PRE
						
						THEN	lrr:= getRestaurantDishRest(rr)
					
						END;
					
					ldd<--getDishRestaurant(rr)=
						PRE
						
						THEN	ldd:=getDishRestaurantRest(rr)
					
						END;
						
					newTray(cc)=
						PRE
						
						THEN	newTrayRest(token,cc) ||
								token := token + 1
					
						END;
					
					addDishTOTray(tr,dd)=
						PRE
						
						THEN	addDishTOTrayRest(tr,dd)
					
						END;
					
					removeDishFromTray(tr,dd)=
						PRE
						
						THEN	removeDishFromTrayRest(tr,dd)
					
						END;
						
					checkOutTray(tr)=
						PRE
						
						THEN	checkOutTrayRest(tr)
					
						END;
						
					payTray(tr)=
						PRE
						
						THEN	payTrayRest(tr)
					
						END;
						
					cancelTray(tr)=
						PRE
						
						THEN	cancelTrayRest(tr)
					
						END;
					
					pp<--computePriceOfTray(tr)=
						PRE
						
						THEN	pp := computePriceOfTrayRest(tr)
					
						END
						
END
					
						
						
					
					
			
					