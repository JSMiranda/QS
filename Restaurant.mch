// VER DUVIDAS DE Dish!

MACHINE			Restaurant(maxprice)

SEES			Dish

SETS			RESTAURANTS, RESTNAMES, RESTADDRESSSES

VARIABLES		restaurants, address, name, prices, rdishes, rIsVegetarian
				
INVARIANT
				rdishes: restaurants <-> dishes   				//será?
				restaurants <: RESTAURANTS &
				address : restaurants --> RESTADDRESSSES & 		
				name : restaurants --> RESTNAMES &			
				prices : rdishes --> 0..maxprice &			//verificar sintaxe
				!(r).(r : dom(rdishes) => (card({r}<|rdishes)) : 5..15)
				rIsVegetarian : restaurants --> BOOL

INITIALISATION	restaurants := {}

OPERATIONS
				newRestaurant
				addDishToRestaurant
				removeDishFromRestaurant
				changePrice
				getDishPrice

				bb <-- isVegetarianRestaurant(rr) =
				PRE rr : restaurants
				THEN
					bb := isVegetarian (rr)
				END;

				setVegetarianRestaurant(rr, bb) =
				PRE  rr : restaurants
					 & bb : BOOL
				THEN
					 bb <+ {rr |-> rIsVegetarian}
				END;

				name <-- getRestaurantName(rr) =
				PRE rr : restaurants
				THEN
					name := name(rr)
				END;

				getRestaurantAddress
				getRestaurantsDish
				getDishRestaurant // retorna o "menu" do rest

END



// f: x -> Y   com  ran(f) = y   no rest
