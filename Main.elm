module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import StartApp.Simple exposing (start)
import Model exposing (Model)
import Update exposing (Action)
import EducationRow


-- Updates
-- View
-- put table in a div and style it all.


createTable : List Html -> Html
createTable rows =
  ul [] rows


view : Signal.Address Action -> Model -> Html
view address items =
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
  StartApp.Simple.start
    { model = Model.init
    , update = Update.update
    , view = view
    }
