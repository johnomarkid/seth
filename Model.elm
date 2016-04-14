module Model (..) where


type alias Model =
  { education : List Education
  , jobs : List Job
  }


type alias Education =
  { id : Int, school : String, description : String }


type alias Job =
  { id : Int, job : String, description : String }


initEducation : List Education
initEducation =
  [ { id = 0
    , school = "Boston College"
    , description = "Catholic school with a lot of nice buildings."
    }
  , { id = 1
    , school = "Boston College"
    , description = "Catholic school with a lot of nice buildings."
    }
  ]


initJobs : List Job
initJobs =
  [ { id = 0
    , job = "Bitfountain"
    , description = "Teaching people to code."
    }
  ]


init : Model
init =
  { education = initEducation
  , jobs = initJobs
  }
