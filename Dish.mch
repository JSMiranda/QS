// CLIENTS, DISHES, RESTAURANTS, TRAYS

MACHINE				Dish

SETS				DISHES, NAMES, DESCRIPTIONS, BOOL = {true, false}

VARIABLES			dishes,	description, name, isVegetarian

INVARIANT			dishes <: DISHES &         
					description : dishes --> DESCRIPTIONS &
					name : dishes --> NAMES &				 
					isVegetarian : dishes --> BOOL 
					
INITIALISATION		dishes := {} 

OPERATIONS
					newDish(dd, name, desc, bool) =   
					PRE dd : DISHES
						& dd /: dishes
						& name : NAMES
						& desc : DESCRIPTIONS
						& bool : BOOL
					THEN
						dishes := dishes \/ {dd} ||
						name <+ {dd |-> name} ||
						description <+ {dd |-> desc} ||
						bool <+ {dd |-> bool}
					END;

					removeDish(dd) =
					PRE dd : dishes &
                        dd :/ rdishes &
                        dd :/ tdishes
					THEN
						dishes := dishes - {dd} ||
						{dd} <<| name			||
						{dd} <<| description	||
						{dd} <<| bool
					END;

					
					name <-- getDishName(dd) =
					PRE dd : dishes            // ou DISHES e "lançar excepcao" caso /: a dishes ?
					THEN
						name := name(dd)
					END;

					desc <-- getDishDescription(dd) =
					PRE dd : dishes
					THEN
						desc := description(dd)
					END;

					bb <-- isVegetarianDish(dd) =
					PRE dd : dishes
					THEN
						bb := isVegetarian(dd)
					END
					
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

END
