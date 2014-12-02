// VER DUVIDAS DE Dish!

MACHINE			Restaurant

SEES			Dish

SETS			RESTAURANTS, RESTNAMES, RESTADDRESSSES

CONSTANT		maxprice := 20  								//verificar sintaxe

VARIABLES		restaurants, address, name, prices, rdishes
				
INVARIANT
				rdishes: restaurants <--> dishes   				//será?
				restaurants <: RESTAURANTS &
				address : restaurants --> RESTADDRESSSES & 		
				name : restaurants --> RESTNAMES &			
				prices : rdishes --> {0..maxprice} &			//verificar sintaxe
				!(r).(r : dom(rdishes) => (card(rdishes <| {r})) : {5..15})   //verificar sintaxe

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
				getDishRestaurant // retorna o "menu" do rest

END



// f: x -> Y   com  ran(f) = y   no rest
