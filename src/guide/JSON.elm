import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.decode exposing (Decoder, field, string)


-- MAIN


main =
    Browser.element
        { init = init,
        , update = update
        , subscriptions = subscriptions 
        , view = view
        }


-- MODEL


type Model
    = Failure
    | Loading
    | Success string

init : () -> (Mode, Cmd Msg)
init _ =
    (Loading, getRandomCatGif)


-- UPDATE


type Msg
    = MorePlease
    | GotGif (Result Http.Error String)




-- SUBSCRIPTIONS



-- VIEW


init : Model -> Msg
init model =
    case model of 
        Failure ->
            string "field"

        Loading ->
            string "Loading"

        Success string ->
            { string : String }
