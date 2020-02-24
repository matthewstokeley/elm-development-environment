import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


-- MAIN


-- initialize the main thread
main =
	Browser.sandbox { init = init, update = update, view = view }


-- MODEL

-- create a record for our model
type alias Model =
	{ name : String
	, password: String
	, passwordAgain: String
	}

init : Model

init = 
	Model "" "" ""


-- UPDATE


type Msg
	= Name String
	| Password String
	| PasswordAgain String


-- the update fn accepts a message param and return a model closure
update : Msg -> Model -> Model
update msg model =
	case msg of
		Name name ->
			{ model | name = name }

		Password password ->
			{ model | password = password }


-- VIEW

view : Model -> Html Msg
view model =
	div []
		[ viewInput "text" "Name" model.name Name
		, viewInput "password" "Password" model.password Password
		, viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
		, viewValidation model
		]

viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
	input [ type_ t, placeholder p, value v, onInput toMsg ] []

viewValidation : Model -> Html msg
viewValidation model =
	if model.password == model.passwordAgain then
		div [ style "color" "green" ] [ text "OK" ]
	else 
		div [ style "color" "red" ] [ text "Something's Wrong" ]