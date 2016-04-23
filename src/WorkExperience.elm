module WorkExperience (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Style exposing (..)
import Utils
import Styles


type Action
  = Update Job String
  | Remove Int
  | Add


type alias Model =
  List Job


type alias Job =
  { id : Int
  , position : String
  , company : String
  , website : String
  , timespan : String
  , description : String
  }


initEducation : Int -> Job
initEducation id =
  { id = id
  , position = "Interaction Designer"
  , company = "Bitfountain"
  , website = "www.bitfountain.io"
  , timespan = "August 2012 - Current"
  , description = "I founded Bitfountain in 2012 with the goal of teaching people how to become expert developers. Over 110,000 students have taken our online video courses, and I lead the company to over $3M in revenue. We are completely bootstrapped."
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


jobRow : Signal.Address Action -> Job -> Html
jobRow address item =
  let
    linespace =
      [ Style.marginBottom (px 10) ]
  in
    li
      []
      [ input
          [ style (Styles.panelItemHeader ++ linespace)
          , value item.position
          , on
              "input"
              targetValue
              (\v -> Signal.message address (Update { item | position = v } v))
          ]
          []
      , input
          [ style (Styles.panelItemDetail ++ linespace)
          , value item.company
          , on
              "input"
              targetValue
              (\v -> Signal.message address (Update { item | company = v } v))
          ]
          []
      , input
          [ style (Styles.panelItemDetail ++ linespace)
          , value item.website
          , on
              "input"
              targetValue
              (\v -> Signal.message address (Update { item | website = v } v))
          ]
          []
      , input
          [ style (Styles.panelItemDetail ++ linespace)
          , value item.timespan
          , on
              "input"
              targetValue
              (\v -> Signal.message address (Update { item | timespan = v } v))
          ]
          []
      , textarea
          [ style (Styles.panelDescription ++ linespace)
          , value item.description
          , on
              "input"
              targetValue
              (\v -> Signal.message address (Update { item | description = v } v))
          ]
          []
      , button [ onClick address (Remove item.id) ] [ text "delete" ]
      ]



-- TODO try to set up mailbox and signal for onKeyUp to update input size


view : Signal.Address Action -> Model -> Html
view address items =
  let
    rows =
      List.map (jobRow address) items
  in
    div
      [ style Styles.panelBackground ]
      [ div
          []
          [ p [ style Styles.panelHeader ] [ text "Work Experience" ]
          , ul [ style Styles.panelTable ] rows
          , button [ onClick address Add ] [ text "add new" ]
          ]
      ]
