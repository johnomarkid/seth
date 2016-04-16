module EducationRow (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Model)


type Action
  = Update
  | Remove Int


update : Action -> Model.Education -> Model
update action model =
  case action of
    Update ->
      model

    Remove id ->
      model


view : Signal.Address Action -> Model.Education -> Html
view address item =
  li
    []
    [ span
        []
        [ input
            [ value item.school
              --, on "input" targetValue (\v -> Signal.message address v)
              --, on "input" targetValue (address (Update item.id))
            , inputStyle
            ]
            []
        , div [] [ text "hey" ]
        , button [ onClick address (Remove item.id) ] [ text "delete" ]
        ]
    ]


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



{-

to learn:

1) how to update input with targetValue
2) how to style hover states and stuff


-}
