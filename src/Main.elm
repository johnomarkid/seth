module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import StartApp.Simple exposing (start)
import Education
import WorkExperience


-- Model


type alias Model =
  { education : Education.Model
  , jobs : WorkExperience.Model
  }


init : Model
init =
  { education = Education.model
  , jobs = WorkExperience.model
  }



-- Update


type alias ID =
  Int


type Action
  = NoOp
  | EducationAction Education.Action
  | WorkExperienceAction WorkExperience.Action


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

    WorkExperienceAction subAction ->
      let
        updatedWork =
          WorkExperience.update subAction model.jobs
      in
        { model | jobs = updatedWork }



-- View
-- put table in a div and style it all.


view : Signal.Address Action -> Model -> Html
view address items =
  let
    educationTable =
      Education.view (Signal.forwardTo address EducationAction) items.education

    workExperienceTable =
      WorkExperience.view (Signal.forwardTo address WorkExperienceAction) items.jobs
  in
    div
      []
      [ educationTable
      , workExperienceTable
      ]



-- Boilerplate


main =
  StartApp.Simple.start
    { model = init
    , update = update
    , view = view
    }
