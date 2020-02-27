-- Custom Types

-- Similar to TypeScript Union Types

type UserStatus = Regular | Visitor

type UserStatus
	= Regular
	| Visitor

type alias User =
	{ User : User
	, Name : String
	}

--- type alias and type combined into a single custom type

type User
	= Regular String Int 
	| Vistor String

-- describe toName - accepts a User type and returns a String type
toName : User -> String
-- declare the function -- the toName method accepts the user parameter
toName user =
	-- case / switch - user contains properties of
	case user of
		-- regular, which accepts a name parameter and an unused parameter
		-- delineated here with a wildcard: `_`
		Regular name _ ->
			name

		-- vistor accepts a string
		Visitor name ->
			name

