module EducationView (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import EducationRow
import JobRow


-- Model
-- create a dict of vals that will represent the different types of rows.
-- each one is a list of rows. rows are all that really change.


type alias Model =
  { education : Education
  , jobs : Jobs
  }


type alias Education =
  List
    { id : Int
    , row : EducationRow.Model
    }


type alias Jobs =
  List
    { id : Int
    , row : JobRow.Model
    }


initEducation : Education
initEducation =
  [ { id = 0
    , row = EducationRow.init 0
    }
  , { id = 1
    , row = EducationRow.init 1
    }
  ]


initJobs : Jobs
initJobs =
  [ { id = 0
    , row = JobRow.init 0
    }
  , { id = 1
    , row = JobRow.init 1
    }
  ]


init : Model
init =
  { education = initEducation
  , jobs = initJobs
  }



-- Update


type Action
  = NoOp
  | UpdateField



-- View

createTable : List Html -> Html
createTable rows =
  ul [] rows


view : Model -> Html
view items =
  let
    -- cycle through each dict value and send list of rows to table
    educationTable =
      List.map (\data -> createTable EducationRow.view data.row) items.education
  in
    div
      []
      [ educationTable
      ]
