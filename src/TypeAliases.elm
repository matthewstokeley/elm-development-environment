-- type alias a record
type alias User =
	{ name : String
	, age : Int,
	, email : String
	}

-- functon declaration

-- function type
hasAge : User -> Bool
-- expression
hasAge user =
	user.age

-- type aliases for records create a record constructor

type alias User = { name : String, age : Int }


-- repl 
-- > type alias User = { name : String, age : Int }

-- > User
-- <function> : String -> Int -> User

-- > User "Sue" 22
-- { age = 22, name = "Sue" } : User

-- > User "Tom" 62
-- { age = 62, name = "Tom" } : User

