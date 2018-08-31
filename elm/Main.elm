module Main exposing (..)

import Html
import View exposing (view)
import Update exposing (update)
import Model exposing (Model, initModel)
import Types exposing (Msg(..))


main : Program Never Model Msg
main =
    Html.program
        { init = ( initModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
