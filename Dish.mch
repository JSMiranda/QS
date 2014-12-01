// CLIENTS, DISHES, RESTAURANTS, TRAYS

MACHINE				Dish

SETS				DISHES, BOOL = {true, false}

VARIABLES			dishes,	description, name, isVegetarian

INVARIANT			dishes <: DISHES &         
					description : dishes --> DESCRIPTIONS &
					name : dishes --> NAMES &				  // verificar tipo de funcao (e se parte do conjunto DISHES ou dishes
					isVegetarian : dishes --> BOOL 
					
INITIALISATION		dishes := {} 

OPERATIONS
					newDish(dd, name, desc, bool) =   // verificar se se pode usar "bool"
					PRE dd : DISHES
						& dd /: dishes
						& name : NAMES
						& desc : DESCRIPTIONS
						& bool : BOOL
					THEN
						dishes := dishes \/ {dd} ||
						name <+ {dd |-> name} ||
						description <+ {dd |-> desc} || // verificar syntax
						bool <+ {dd |-> bool}
					END;

					removeDish(dd) =					// TODO: adicionar a precond dd :/ restaurant.dishes (para todos os rests) & em trays nao pagas! 
					PRE dd : dishes
					THEN
						dishes := dishes - {dd} ||
						name <- {dd |-> name} ||
						description <- {dd |-> desc} || // verificar syntax (<- especificamente)
						bool <- {dd |-> bool}           // e ver se podemos remover aqui,
					END;                                // e se faz sentido definir o invariante
														// por causa disto

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

END
