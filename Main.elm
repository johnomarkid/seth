module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import EducationView


-- Model


type alias Model =
  List String



-- Updates
-- View


view : Html
view =
  EducationView.view



-- Boilerplate
