module Update (..) where

import Model exposing (Model)
import EducationRow


type alias ID =
  Int


type Action
  = NoOp
  | Add
  | Remove ID
  | UpdateText ID
  | EducationAction EducationRow.Action



-- using this because List.head returns maybe in case list is empty
-- we're causing a crash now but we'll just not allow them to delete
-- if the list has only 1 val


fromJust : Maybe a -> a
fromJust x =
  case x of
    Just y ->
      y

    Nothing ->
      Debug.crash "error: fromJust Nothing"


update : Action -> Model -> Model
update action model =
  case action of
    NoOp ->
      model

    Add ->
      let
        oldID =
          (.id (fromJust (List.head model.education)))

        newEd =
          (Model.initEducation (oldID + 1)) :: model.education
      in
        { model | education = newEd }

    Remove id ->
      -- use List.filter
      let
        newEd =
          List.filter (\data -> data.id /= id) model.education
      in
        { model | education = newEd }

    UpdateText id ->
      model

    EducationAction subAction ->
      let
        updatedEd =
          EducationRow.update subAction (Model.initEducation 2)

        newEd =
          updatedEd :: model.education
      in
        { model | education = updatedEd }
