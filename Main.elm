module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import StartApp.Simple exposing (start)
import Education
import JobRow


-- Model


type alias Model =
  { education : Education.Model
  , jobs : List JobRow.Model
  }


init : Model
init =
  { education = Education.model
  , jobs = []
  }



-- Update


type alias ID =
  Int


type Action
  = NoOp
  | EducationAction Education.Action


update : Action -> Model -> Model
update action model =
  case action of
    NoOp ->
      model

    EducationAction subAction ->
      let
        updatedEd =
          Education.update subAction model.education
      in
        { model | education = updatedEd }



-- View
-- put table in a div and style it all.


view : Signal.Address Action -> Model -> Html
view address items =
  let
    educationTable =
      Education.view (Signal.forwardTo address EducationAction) items.education
  in
    div
      []
      [ educationTable ]



-- Boilerplate


main =
  StartApp.Simple.start
    { model = init
    , update = update
    , view = view
    }
