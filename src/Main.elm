module Main exposing (main)

import Browser
import Html exposing (Html, div, input, text)
import Html.Events exposing (onInput)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Model =
    { maybeNumber : Maybe Int
    }


type Msg
    = UserEnteredInput String


init : Model
init =
    { maybeNumber = Nothing
    }


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ input [ onInput UserEnteredInput ]
                []
            ]
        , case model.maybeNumber of
            Nothing ->
                text "Please enter a number!"

            Just number ->
                div []
                    [ div []
                        [ text
                            ("You have entered the number: "
                                ++ String.fromInt number
                            )
                        ]
                    , div []
                        [ text
                            (String.fromInt number
                                ++ " multiplied by 100 is: "
                                ++ String.fromInt (number * 100)
                            )
                        ]
                    ]
        ]


update : Msg -> Model -> Model
update message oldModel =
    case message of
        UserEnteredInput inputString ->
            { oldModel
                | maybeNumber = String.toInt inputString
            }
