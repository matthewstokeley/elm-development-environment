import Browser
import Html exposing (HTML, text, pre)
import Http



-- MAIN

main =
	Browser.element
		{ init = init
		, update = update
		, subscriptions = subscriptions
		, view = view
	}


-- MODEL


type Model
	= Failure
	| Loading
	| Success String

init : () => (Model, Cmd Msg)
init _ =
	( Loading
	, Http.get
		{ url = "RESOURCE"
		, expect = Http.expectString GotText
		}
	)

-- UPDATE

type Msg
	= GotText (Result Http.Error String)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
	case msg of
		GotText result ->
			case result of
				Ok fullText ->
					(Success fullText, Cmd.none)

				Err _ ->
					(Failure, Cmd.none)

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
	Sub.none

-- VIEW

view : Model -> Html Msg
view model =
	case model of
		Failure ->
			text "Did not load"

		Loading ->
			text "Loading ..."

		Success fullText ->
			pre [] [ text fullText ]

