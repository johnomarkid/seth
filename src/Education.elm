module Education (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Utils
import Styles


type Action
  = Update Education String
  | Remove Int
  | Add


type alias Model =
  List Education


type alias Education =
  { id : Int, school : String, description : String }


initEducation : Int -> Education
initEducation id =
  { id = id
  , school = "Boston University"
  , description = "Catholic school with a lot of nice buildings."
  }


model : Model
model =
  [ initEducation 0 ]


update : Action -> Model -> Model
update action model =
  case action of
    Update item text ->
      let
        newModel =
          List.map
            (\v ->
              if v.id == item.id then
                item
              else
                v
            )
            model
      in
        newModel

    Remove id ->
      let
        removeModel =
          List.filter (\data -> data.id /= id) model
      in
        removeModel

    Add ->
      let
        lastID =
          (.id (Utils.fromJust (List.head model)))

        newModel =
          (initEducation (lastID + 1)) :: model
      in
        newModel


educationRow : Signal.Address Action -> Education -> Html
educationRow address item =
  li
    []
    [ span
        []
        [ text ("id: " ++ (toString item.id) ++ "   ")
        , input
            [ value item.school
            , on
                "input"
                targetValue
                (\v -> Signal.message address (Update { item | school = v } v))
            , style (Styles.inputStyle ++ Styles.titleFont)
            ]
            []
        , input
            [ value item.description
            , on
                "input"
                targetValue
                (\v -> Signal.message address (Update { item | description = v } v))
            , style Styles.inputStyle
            ]
            []
        , button [ onClick address (Remove item.id) ] [ text "delete" ]
        ]
    ]


view : Signal.Address Action -> Model -> Html
view address items =
  let
    rows =
      List.map (educationRow address) items
  in
    div
      [ style Styles.panelBackground ]
      [ ul [ style Styles.ulStyle ] rows
      , button [ onClick address Add ] [ text "add new" ]
      ]



{-

to learn:

1) how to style hover states and stuff
use Html.Events to update state. Maybe put styles in the model to update them?
But what happens when I update a style like inputBackground and it changes all of them,
not just the one hovered on?

Use elm-css because it has everything i want and it makes css type checked.


2) abstract update function to apply to all tables. can use input field name to equal
record name so jobs and schools are properly location in update.


-}
