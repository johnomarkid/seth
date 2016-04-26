module GrowTextarea (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


{-
every time scrollHeight changes we will call growtextarea. but we want to send the
div selector, get the data we need to calculate the growth in js, and send back numLines need in our model.

our scrollHeight port should be numLines because that's all we need to know.
-}


port scrollHeight : Signal Int
sigmodel =
  Signal.foldp update (init "happiness") (Signal.map GrowTextarea scrollHeight)


port sendSelector : Signal Model
port sendSelector =
  sigmodel


type alias Model =
  { text : String, numLines : Int, numCols : Int, growSelector : String }


init : String -> Model
init t =
  { text = t, numLines = 2, numCols = 20, growSelector = "my-text-area" }



--try to calc num lines here.


type Action
  = UpdateText String
  | GrowTextarea Int


update : Action -> Model -> Model
update action model =
  case action of
    UpdateText t ->
      { model | text = t }

    GrowTextarea newScrollHeight ->
      let
        test =
          Debug.log "rows: " newScrollHeight
      in
        model


view : Signal.Address Action -> Model -> Html
view address model =
  let
    sh =
      Debug.log "scroll height: " scrollHeight
  in
    div
      [ class "textarea"
      , contenteditable True
      ]
      []



-- textarea
--   [ id model.growSelector
--   , value model.text
--     -- , rows model.numLines
--     -- , cols model.numCols
--   , onKeyUp address (\_ -> GrowTextarea 33)
--   , on
--       "input"
--       targetValue
--       (\v -> Signal.message address (UpdateText v))
--   ]
--   []
