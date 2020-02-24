--- Maybe pattern

type Maybe a
	= Just a
	| Nothing

--- Error pattern

type Error
	= BaseUrl String
	| Timeout
	| NetworkError
	| BadStatus Int
	| BadBody String

Error : Error -> String
Error error =
	case error of
		
		BaseUrl url ->
			url

		Timeout _ ->
			"Tmeout"
