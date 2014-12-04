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
					newDishRest(dd, name, desc, bool) =   
					PRE dd : DISHES
						& dd /: dishes
						& name : NAMES
						& name /: names  //TODO tá mal é preciso nao estar nos ran da funçao name
						& desc : DESCRIPTIONS
						& bool : BOOL
					THEN
						dishes := dishes \/ {dd} ||
						name <+ {dd |-> name} ||
						description <+ {dd |-> desc} ||
						bool <+ {dd |-> bool}
					END;

					removeDishRest(dd) =
					PRE dd : dishes &
                        dd :/ rdishes &
                        dd :/ tdishes
					THEN
						dishes := dishes - {dd} ||  
						{dd} <<| name			||
						{dd} <<| description	||
						{dd} <<| bool
					END;

					
					name <-- getDishNameRest(dd) =
					PRE dd : dishes            
					THEN
						name := name(dd)
					END;

					desc <-- getDishDescriptionRest(dd) =
					PRE dd : dishes
					THEN
						desc := description(dd)
					END;

					bb <-- isVegetarianDishRest(dd) =
					PRE dd : dishes
					THEN
						bb := isVegetarian(dd)
					END
					
					
				
			
				

END
