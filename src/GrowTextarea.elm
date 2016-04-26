module GrowTextarea (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- goal: create growing textarea component
--- test


focusMailbox : Signal.Mailbox String
focusMailbox =
  Signal.mailbox ""


port focus : Signal String
port focus =
  focusMailbox.signal


addresses =
  { focus = focusMailbox.address
  }



{-
every time scrollHeight changes we will call growtextarea. but we want to send the
div selector, get the data we need to calculate the growth in js, and send back numLines need in our model.

our scrollHeight port should be numLines because that's all we need to know.
-}


sigmodel =
  Signal.foldp update (init "happiness") (Signal.map GrowTextarea scrollHeight)


port sendSelector : Signal Model
port sendSelector =
  sigmodel


type alias Model =
<<<<<<< HEAD
  { text : String, numLines : Int, numCols : Int }
=======
  { text : String, numLines : Int, numCols : Int, growSelector : String }
>>>>>>> a4bdba06214b27a2be757af8051d93430da16e10


init : String -> Model
init t =
<<<<<<< HEAD
  { text = t, numLines = 20, numCols = 20 }
=======
  { text = t, numLines = 2, numCols = 20, growSelector = "my-text-area" }
>>>>>>> a4bdba06214b27a2be757af8051d93430da16e10



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
<<<<<<< HEAD
    myspan =
      node "span" [] [ text "hello world" ]
  in
    textarea
      [ id "my-grow"
=======
    sh =
      Debug.log "scroll height: " scrollHeight
  in
    textarea
      [ id model.growSelector
>>>>>>> a4bdba06214b27a2be757af8051d93430da16e10
      , value model.text
        -- , rows model.numLines
        -- , cols model.numCols
      , onKeyUp address (\_ -> GrowTextarea 33)
      , on
          "input"
          targetValue
          (\v -> Signal.message address (UpdateText v))
      ]
      []
