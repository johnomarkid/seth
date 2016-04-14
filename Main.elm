module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model
import EducationRow


-- Updates
-- View
-- put table in a div and style it all.


createTable : List Html -> Html
createTable rows =
  ul [] rows


view : Model.Model -> Html
view items =
  let
    -- cycle through each dict value and send list of rows to table
    educationTable =
      List.map (\data -> EducationRow.view data) items.education
        |> createTable
  in
    div
      []
      [ educationTable ]



-- Boilerplate


main =
  view Model.init
