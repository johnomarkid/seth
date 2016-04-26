module Education (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Style exposing (..)
import GrowTextarea exposing (..)
import Utils
import Styles


type Action
  = Remove Int
  | Add
  | UpdateSchool Education GrowTextarea.Action
  | UpdateDescription Education GrowTextarea.Action
  | UpdateTimespan Education GrowTextarea.Action


type alias Model =
  List Education


type alias Education =
  { id : Int
  , school : GrowTextarea.Model
  , description : GrowTextarea.Model
  , timespan : GrowTextarea.Model
  }


initEducation : Int -> Education
initEducation id =
  { id = id
  , school = GrowTextarea.init "Boston College"
  , description = GrowTextarea.init "BA Philosophy and Physics"
  , timespan = GrowTextarea.init "2006 - 2010"
  }


model : Model
model =
  [ initEducation 0 ]


update : Action -> Model -> Model
update action model =
  case action of
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
          (initEducation (lastID + 1))
            :: model
      in
        newModel

    UpdateSchool item subAction ->
      let
        newStuff =
          GrowTextarea.update subAction item.school

        newModel =
          List.map
            (\v ->
              if v.id == item.id then
                { item | school = newStuff }
              else
                v
            )
            model
      in
        newModel

    UpdateDescription item subAction ->
      let
        newStuff =
          GrowTextarea.update subAction item.description

        newModel =
          List.map
            (\v ->
              if v.id == item.id then
                { item | description = newStuff }
              else
                v
            )
            model
      in
        newModel

    UpdateTimespan item subAction ->
      let
        newStuff =
          GrowTextarea.update subAction item.timespan

        newModel =
          List.map
            (\v ->
              if v.id == item.id then
                { item | timespan = newStuff }
              else
                v
            )
            model
      in
        newModel


educationRow : Signal.Address Action -> Education -> Html
educationRow address item =
  let
    linespace =
      [ Style.marginBottom (px 0) ]

    commonStyle =
      style
        []
  in
    li
      []
      [ GrowTextarea.view
          (Signal.forwardTo address (UpdateSchool item))
          item.school
          (Styles.panelItemHeader ++ linespace)
      , GrowTextarea.view
          (Signal.forwardTo address (UpdateDescription item))
          item.description
          (Styles.panelDescription ++ linespace)
      , GrowTextarea.view
          (Signal.forwardTo address (UpdateTimespan item))
          item.timespan
          (Styles.panelDescription ++ linespace)
      , button [ onClick address (Remove item.id) ] [ text ("delete " ++ (toString item.id)) ]
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
