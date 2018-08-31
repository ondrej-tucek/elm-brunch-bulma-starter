module Update exposing (..)

import Model exposing (Model)
import Types exposing (Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ShowText isDisplayed ->
            ( { model
                | text = "Elm is Cool"
                , isTextDisplayed = not isDisplayed
              }
            , Cmd.none
            )

        NoOp ->
            ( model, Cmd.none )
