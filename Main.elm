module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import EducationView


-- Model


type alias Model = EducationView.Model


init : Model
init = EducationView.init



-- Updates
-- View


view : Html
view =
  EducationView.view init


-- Boilerplate


main =
  view
