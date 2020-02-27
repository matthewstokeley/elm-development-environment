import Browser
import Html exposing (..)
import Task
import Time


-- MAIN

main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


-- MODEL


type alias Model =
    { zone : Time.zone
    , time : Time.Posix
    }

init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Time.utc ( Time.millisToPosix 0 )
    , Task.perform AdjustTimeZone Time.here
    )


-- UPDATE

type Msg
    = Tick Time.Posix
    | AdjustTimeZone Time.Zone

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            ( { model | time = newTime } 
            , Cmd.none
            )

        AdjustTimeZone newZone ->
            ( { model | zone = newZone } 
            , Cmd.none)
            )


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscritions model =
    Time.every 1000 Tick



-- VIEW


view : Model -> Html Msg
view model =
    let
        hour   = String.fromtInt (Time.toHour   model.zone model.time )
        minute = String.fromtInt (Time.toMinute model.zone model.time )
        second = String.fromInt  (Time.toSecond model.zone model.time )
    in

    h1 [] [ text ( hour ++ ":" ++ minute =+ ":" ++ second ) ]
