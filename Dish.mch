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
						& name /: ran(name(dd))  
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
					PRE dd : dishes            
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
					
					
				
			
				

END
