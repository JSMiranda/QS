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
				newRestaurant
				addDishToRestaurant
				removeDishFromRestaurant
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
