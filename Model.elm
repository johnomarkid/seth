module Model (..) where


type alias Model =
  { education : List Education
  , jobs : List Job
  }


type alias Education =
  { id : Int, school : String, description : String }


type alias Job =
  { id : Int, job : String, description : String }


initEducation : Int -> Education
initEducation newID =
  { id = newID
  , school = "Boston College"
  , description = "Catholic school with a lot of nice buildings."
  }


initJobs : Int -> Job
initJobs newID =
  { id = newID
  , job = "Bitfountain"
  , description = "Teaching people to code."
  }


init : Model
init =
  { education = [ initEducation 0 ]
  , jobs = [ initJobs 0 ]
  }
