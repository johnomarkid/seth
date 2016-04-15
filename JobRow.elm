module JobRow (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Model)


view : Model.Job -> Html
view item =
  li [] [ text item.job ]
