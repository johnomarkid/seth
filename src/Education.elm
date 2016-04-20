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
  { id : Int, school : String, description : String, timespan : String }


initEducation : Int -> Education
initEducation id =
  { id = id
  , school = "Boston College"
  , description = "BA Philosophy and Physics"
  , timespan = "2006 - 2010"
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


itemRow : Signal.Address Action -> String -> Html
itemRow address item =
  li
    []
    [ input
        [ style Styles.panelItemHeader
        , value item.item
        , on
            "input"
            targetValue
            (\v -> Signal.message address (Update { item | item = v } v))
        ]
        []
    ]


educationRow : Signal.Address Action -> Education -> Html
educationRow address item =
  let
    fields : List String
    fields =
      [ "school", "description", "timespan" ]

    rows =
      List.map (\v -> itemRow address item.v) fields
  in
    li
      [ style Styles.panelLine ]
      [ ul [] rows ]



-- educationRow : Signal.Address Action -> Education -> Html
-- educationRow address item =
--   li
--     [ style Styles.panelLine ]
--     [ input
--         [ style Styles.panelItemHeader
--         , value item.school
--         , on
--             "input"
--             targetValue
--             (\v -> Signal.message address (Update { item | school = v } v))
--         ]
--         []
--     , input
--         [ style Styles.panelDescription
--         , value item.description
--         , on
--             "input"
--             targetValue
--             (\v -> Signal.message address (Update { item | description = v } v))
--         ]
--         []
--     , input
--         [ style Styles.panelDescription
--         , value item.timespan
--         , on
--             "input"
--             targetValue
--             (\v -> Signal.message address (Update { item | timespan = v } v))
--         ]
--         []
--     , button [ onClick address (Remove item.id) ] [ text "delete" ]
--     ]


view : Signal.Address Action -> Model -> Html
view address items =
  let
    rows =
      List.map (educationRow address) items
  in
    div
      [ style Styles.panelBackground ]
      [ div
          []
          [ p [ style Styles.panelHeader ] [ text "Education" ]
          , ul [ style Styles.panelTable ] rows
          , button [ onClick address Add ] [ text "add new" ]
          ]
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
