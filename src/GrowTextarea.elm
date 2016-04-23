module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- goal: create growing textarea component


type alias Model =
  { text : String, numLines : Int }


init : String -> Model
init t =
  { text = t, numLines = 2 }



--try to calc num lines here.


type Action
  = UpdateText String
  | GrowField


update : Action -> Model -> Model
update action model =
  case action of
    UpdateText text ->
      model

    GrowField ->
      model


view : Signal.Address Action -> Model -> Html
view address model =
  textarea
    [ value model.text
    , rows model.numLines
    , on
        "input"
        targetValue
        (\v -> Signal.message address (UpdateText v))
    ]
    []
