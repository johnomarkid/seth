module Styles (..) where

import Style exposing (..)
import Color exposing (..)


type alias Styles =
  List ( String, String )


inputStyle : Styles
inputStyle =
  [ border none
  , backgroundColor (color' (rgba 0 0 0 0))
  ]


panelBackground : Styles
panelBackground =
  [ backgroundColor (color' (rgb 248 248 248))
  , boxShadow "0px 1px 4px rgba(209, 202, 202, 0.5)"
    --, padding ((px 10) ++ (px 30) ++ (px 10) ++ (px 30))
  , padding "10px 30px 10px 30px"
  ]


panelInnerDiv : Styles
panelInnerDiv =
  []


panelTable : Styles
panelTable =
  [ paddingLeft (px 0)
  , lineHeight (px 30)
  ]


panelHeader : Styles
panelHeader =
  [ fontWeight normal
  , fontSize (px 24)
  ]


panelItemHeader : Styles
panelItemHeader =
  [ fontSize (px 18)
  , color (color' (rgb 102 172 255))
  , width (pc 100)
  ]


panelItemDetail : Styles
panelItemDetail =
  [ fontSize (px 10) ]


panelDescription : Styles
panelDescription =
  [ fontSize (px 14)
  , width (pc 100)
  ]
