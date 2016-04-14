module JobRow (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type alias Model =
  { id : Int
  , job : String
  , description : String
  }


init : Int -> Model
init id =
  { id = id
  , job = "Bitfountain"
  , description = "Teaching people to code."
  }

view : Model -> Html
view item =
  li [] [text item.job]
