module MyCss (..) where

import Css exposing (..)
import Css.Elements exposing (body, li, ul, input)
import Css.Namespace exposing (namespace)


type CssClasses
  = Panel


type CssIds
  = Page


css =
  (stylesheet << namespace "seth")
    [ body
        []
    , input
        [ border (px 0)
        , backgroundColor (rgba 0 0 0 0)
        ]
    , (.)
        Panel
        [ backgroundColor (hex "F8F8F8")
          -- , width (pct 100)
          -- , height (pct 100)
        , padding (px 20)
        ]
    ]


titleFont =
  [ fontSize (em 2)
  , color (hex "66ACFF")
  ]


primaryAccentColor =
  hex "ccffaa"
