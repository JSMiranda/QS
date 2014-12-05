
MACHINE				Dish

SETS				   DISHES; NAMES; DESCRIPTIONS; BOOLTF = {true, false}

VARIABLES			dishes,	description, names, isVegetarian

INVARIANT			dishes <: DISHES &         
					   description : dishes --> DESCRIPTIONS &
					   names : dishes --> NAMES &				 
					   isVegetarian : dishes --> BOOLTF
					
INITIALISATION		dishes := {} || description := {} || names := {}
                    || isVegetarian := {}

OPERATIONS
					newDishRest(dd, name, desc, bb) =   
					PRE dd : DISHES
						& dd /: dishes
						& name : NAMES
						& name /: ran(names)  
						& desc : DESCRIPTIONS
						& bb : BOOLTF
					THEN
						dishes := dishes \/ {dd} ||
						names := names <+ {dd |-> name} ||
						description := description <+ {dd |-> desc} ||
						isVegetarian := isVegetarian <+ {dd |-> bb}
					END;








					removeDishRest(dd) =
					PRE dd : dishes 
                    
					THEN
						dishes := dishes - {dd} ||  
						names := {dd} <<| names			||
						description := {dd} <<| description	||
						isVegetarian:= {dd} <<| isVegetarian
					END;

					
					name <-- getDishName(dd) =
					PRE dd : dishes            
					THEN
						name := names(dd)
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
