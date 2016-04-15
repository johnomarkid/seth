module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import StartApp.Simple exposing (start)
import Model exposing (Model)
import Update exposing (Action)
import EducationRow
import JobRow


-- Updates
-- View
-- put table in a div and style it all.


createTable : Signal.Address Action -> List Html -> Html
createTable address rows =
  div
    []
    [ ul [ ulStyle ] rows
    ]


view : Signal.Address Action -> Model -> Html
view address items =
  let
    -- cycle through each dict value and send list of rows to table
    educationTable =
      List.map (\data -> EducationRow.view address data) items.education
        |> createTable address

    -- jobTable =
    --   List.map (\data -> JobRow.view data) items.jobs
    --     |> createTable address
  in
    div
      []
      [ educationTable
      , button [ onClick address Update.Add ] [ text "add new" ]
        --  , jobTable
      ]


ulStyle : Attribute
ulStyle =
  style
    [ ( "list-style", "none" ) ]



-- Boilerplate


main =
  StartApp.Simple.start
    { model = Model.init
    , update = Update.update
    , view = view
    }
