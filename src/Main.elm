module Main exposing (main)

import Browser
import Html exposing (Html, text)


main : Program () Model msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Model =
    { maybeNumber : Maybe Int
    }


init : Model
init =
    { maybeNumber = Nothing
    }


view : Model -> Html msg
view model =
    case model.maybeNumber of
        Nothing ->
            text "Please enter a number!"

        Just number ->
            text ("You have entered the number: " ++ String.fromInt number)


update : msg -> Model -> Model
update message oldModel =
    oldModel
