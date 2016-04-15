module EducationRow (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
  { id : Int
  , school : String
  , description : String
  }


init : Int -> Model
init id =
  { id = id
  , school = "Boston College"
  , description = "Catholic school with a lot of nice buildings."
  }


view : Model -> Html
view item =
  li [] [ text item.school ]
