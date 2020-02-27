import Browser

-- MAIN

Document :
    { init : Flags -> ( model, Cmd msg )
    , view : model -> Document msg
    , update : msg -> model -> ( model, Cmd msg )
    , subscriptions : model -> Sub msg
    }
    -> Program flags model msg

type alias Document msg =
    { title : String
    , body : List (Html msg)
    }  


-- VIEW



-- UPDATE



-- SUBSCRIPTIONS
