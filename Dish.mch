// CLIENTS, DISHES, RESTAURANTS, TRAYS

MACHINE				Dish

SETS				DISHES, BOOL = {true, false}

VARIABLES			description : DISHES --> DESCRIPTIONS
					name : DISHES --> NAMES
					isVegetarian : DISHES --> BOOL

INITIALISATION		DISHES <: {}

OPERATIONS
					newDish
					removeDish
					getDishName
					getDishDescription
					isVegetarianDish

END
