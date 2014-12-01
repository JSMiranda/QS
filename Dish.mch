// CLIENTS, DISHES, RESTAURANTS, TRAYS

MACHINE				Dish

SETS				DISHES, BOOL = {true, false}

VARIABLES			dishes,			
					description : dishes --> DESCRIPTIONS,
					name : dishes --> NAMES // verificar tipo de funcao (e se parte do conjunto DISHES ou dishes
					isVegetarian : dishes --> BOOL

INVARIANT			dishes <: DISHES
		// para todo o dish em dishes, existe name : NAME , ... (etc)

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







/*

// CLIENTS, DISHES, RESTAURANTS, TRAYS

MACHINE				Dish

SETS				DISHES, BOOL = {true, false}

VARIABLES			description : DISHES --> DESCRIPTIONS
					name : DISHES --> NAMES // 
					isVegetarian : DISHES --> BOOL

INITIALISATION		DISHES <: {}  // é assim? pode ser = em vez de <: ?

OPERATIONS
					newDish(dd) =  // como tratar do input (name, desc, bool) ?
					PRE dd : DISHES // o que significa o : (ver comentario em *)
					THEN 
					END


					removeDish
					getDishName
					getDishDescription
					isVegetarianDish

END
*/
