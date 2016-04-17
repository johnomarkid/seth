module WorkExperience (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Utils


type Action
  = Update Job String
  | Remove Int
  | Add


type alias Model =
  List Job


type alias Job =
  { id : Int, company : String, description : String }


initJob : Int -> Job
initJob id =
  { id = id
  , company = "Bitfountain"
  , description = "Teaching the world education."
  }


model : Model
model =
  [ initJob 0 ]


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
          (initJob (lastID + 1)) :: model
      in
        newModel


jobRow : Signal.Address Action -> Job -> Html
jobRow address item =
  li
    []
    [ span
        []
        [ text ("id: " ++ (toString item.id) ++ "   ")
        , input
            [ value item.company
            , on
                "input"
                targetValue
                (\v -> Signal.message address (Update { item | company = v } v))
            , inputStyle
            ]
            []
        , input
            [ value item.description
            , on
                "input"
                targetValue
                (\v -> Signal.message address (Update { item | description = v } v))
            , inputStyle
            ]
            []
        , button [ onClick address (Remove item.id) ] [ text "delete" ]
        ]
    ]


view : Signal.Address Action -> Model -> Html
view address items =
  let
    rows =
      List.map (jobRow address) items
  in
    div
      []
      [ ul [ ulStyle ] rows
      , button [ onClick address Add ] [ text "add new" ]
      ]


ulStyle : Attribute
ulStyle =
  style
    [ ( "list-style", "none" ) ]


liStyle : Attribute
liStyle =
  style
    [ ( "font-size", "20px" ) ]


inputStyle : Attribute
inputStyle =
  style
    [ ( "border", "0" )
    , ( "appearance", "none" )
    ]
