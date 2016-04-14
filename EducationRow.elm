module EducationRow (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Education)


view : Education -> Html
view item =
  li [] [ text item.school ]
