module GrowTextarea (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode exposing (..)


targetInnerHTML : Json.Decode.Decoder String
targetInnerHTML =
  at [ "target", "innerHTML" ] Json.Decode.string



{-
every time scrollHeight changes we will call growtextarea. but we want to send the
div selector, get the data we need to calculate the growth in js, and send back numLines need in our model.

our scrollHeight port should be numLines because that's all we need to know.
-}
-- port scrollHeight : Signal Int
-- sigmodel =
--   Signal.foldp update (init "happiness") (Signal.map GrowTextarea scrollHeight)
--
--
-- port sendSelector : Signal Model
-- port sendSelector =
--   sigmodel


type alias Model =
  { text : String }


init : String -> Model
init t =
  { text = t }



--try to calc num lines here.


type Action
  = UpdateText String


update : Action -> Model -> Model
update action model =
  case action of
    UpdateText t ->
      { model | text = t }


view : Signal.Address Action -> Model -> List ( String, String ) -> Html
view address model styles =
  div
    [ class "textarea"
    , contenteditable True
    , style styles
    , on
        "input"
        targetInnerHTML
        (\v -> Signal.message address (UpdateText v))
    ]
    [ text model.text ]
