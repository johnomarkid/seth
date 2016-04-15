module EducationRow (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Model)
import Update


view : Signal.Address Update.Action -> Model.Education -> Html
view address item =
  li
    []
    [ span
        []
        [ input
            [ value item.school
              --, on "input" targetValue (\v -> Signal.message address v)
            , inputStyle
            ]
            []
        , button [ onClick address (Update.Remove item.id) ] [ text "delete" ]
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
