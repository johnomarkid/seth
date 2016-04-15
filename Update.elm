module Update (..) where
import Model exposing (Model)

type Action
    = NoOp
    | Add
    | Remove


update : Action -> Model -> Model
update action model =
  case action of
    NoOp ->
      model

    Add ->
      model

    Remove ->
      model
