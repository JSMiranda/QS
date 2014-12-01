// VER DUVIDAS DE Dish!

MACHINE				Restaurant

SEES				Dish

SETS				RESTAURANTS, RESTNAMES, RESTADDRESSSES

VARIABLES			restaurants,
				address : restaurants --> RESTADDRESSSES, // TODO: Trocar isto para o invariante
				name : restaurants --> RESTNAMES,
				prices : dishes --> NUMBER

INVARIANT
				restaurants <: RESTAURANTS

INITIALISATION

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
