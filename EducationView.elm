module EducationView (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- Model


type alias Model =
  { school : String
  , description : String
  }


init : Model
init =
  { school = "Boston College"
  , description = "Catholic school with a lot of nice buildings."
  }



-- Update


type Action
  = NoOp
  | UpdateField



-- View


view : Html
view =
  div
    []
    [ ul
        []
        [ li [] [ text "here's line 1" ] ]
    ]
