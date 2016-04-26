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



---test


type alias Model =
  { text : String, numLines : Int, numCols : Int }


init : String -> Model
init t =
  { text = t, numLines = 20, numCols = 20 }



--try to calc num lines here.


type Action
  = UpdateText String
  | GrowTextarea


update : Action -> Model -> Model
update action model =
  case action of
    UpdateText t ->
      { model | text = t }

    GrowTextarea ->
      let
        myNode =
          Debug.log "cols: " model.numCols

        test =
          Debug.log "rows: " model.numLines
      in
        model


view : Signal.Address Action -> Model -> Html
view address model =
  let
    myspan =
      node "span" [] [ text "hello world" ]
  in
    textarea
      [ id "my-grow"
      , value model.text
        -- , rows model.numLines
        -- , cols model.numCols
      , onKeyUp address (\_ -> GrowTextarea)
      , on
          "input"
          targetValue
          (\v -> Signal.message address (UpdateText v))
      ]
      []
