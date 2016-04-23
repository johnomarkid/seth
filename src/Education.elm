module Education (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Style exposing (..)
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


educationRow : Signal.Address Action -> Education -> Html
educationRow address item =
  let
    linespace =
      [ Style.marginBottom (px 10) ]
  in
    li
      []
      [ input
          [ style (Styles.panelItemHeader ++ linespace)
          , value item.school
          , on
              "input"
              targetValue
              (\v -> Signal.message address (Update { item | school = v } v))
          ]
          []
      , input
          [ style (Styles.panelDescription ++ linespace)
          , value item.description
          , on
              "input"
              targetValue
              (\v -> Signal.message address (Update { item | description = v } v))
          ]
          []
      , input
          [ style (Styles.panelDescription ++ linespace)
          , value item.timespan
          , on
              "input"
              targetValue
              (\v -> Signal.message address (Update { item | timespan = v } v))
          ]
          []
      , button [ onClick address (Remove item.id) ] [ text "delete" ]
      ]


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
