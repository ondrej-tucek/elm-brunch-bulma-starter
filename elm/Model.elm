module Model exposing (..)


type alias Model =
    { text : String
    , isTextDisplayed : Bool
    }


initModel : Model
initModel =
    { text = ""
    , isTextDisplayed = False
    }
