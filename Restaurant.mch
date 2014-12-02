// VER DUVIDAS DE Dish!

MACHINE			Restaurant(maxprice)

SEES			Dish

SETS			RESTAURANTS, RESTNAMES, RESTADDRESSSES

VARIABLES		restaurants, address, name, prices, rdishes
				
INVARIANT
				rdishes: restaurants <-> dishes   				//será?
				restaurants <: RESTAURANTS &
				address : restaurants --> RESTADDRESSSES & 		
				name : restaurants --> RESTNAMES &			
				prices : rdishes --> 0..maxprice &			//verificar sintaxe
				!(r).(r : dom(rdishes) => (card({r}<|rdishes)) : 5..15)

INITIALISATION	restaurants := {}

OPERATIONS	
				newRestaurant(rr, name, addr, ldish, lprice) =
					PRE 	rr: RESTAURANTS
							& rr /: restaurants
							& name : RESTNAMES
							& addr : RESTADRESSES
							& card(ldishes): {5..15}    //not sure
							& !(p).(p : lprice) => p : {0..maxprice}  //not sure			
					THEN
							restaurants: restaurants \/ {rr} ||
							name <+ {rr |->name} ||
							address <+ {rr |->addr} ||
							rdishes: rdishes ^ ldish ||							// n deve ser isto pois rdishes é um par restaurante/dish e ldish sao so pratos
							prices          // no clue como manusear as lista combinada de restaurantes-dishes e associar um preço aos vares
							
					
					END;
				
			
				addDishToRestaurant(rr,dd,pp) =
					PRE		rr: restaurants
							dd: DISHES
							pp: {0..maxprice}
							!(rr).(rr:restaurants) => ran(card(rdishes)) < 15    //prob wrong, n permitir adição qd size da lista for =15
					
					THEN	//rdishes + o par(rr,dd)    again, como manusear a lista combinada? 
					
					END;
					
				removeDishFromRestaurant(rr, dd) =
					PRE		rr: restaurants
							dd: DISHEs
							!(rr).(rr:restaurants) => ran(card(rdishes)) > 5    //prob wrong again
					
					THEN	//rdishes - o par (rr,dd)       idem
					
					END;
					
					
				
				changePrice
				
				getDishPrice
				getVegetarianRestaurant
				setVegetarianRestaurant
				getRestaurantName
				
				getRestaurantAddress
				getRestaurantsDish
				getDishRestaurant // retorna o "menu" do rest

END



// f: x -> Y   com  ran(f) = y   no rest
