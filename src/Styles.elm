module Styles (..) where


panelBackground : List ( String, String )
panelBackground =
  [ ( "background-color", "#F8F8F8" )
  , ( "box-shadow", "0px 1px 4px rgba(209, 202, 202, 0.5)" )
  ]


ulStyle : List ( String, String )
ulStyle =
  [ ( "list-style", "none" ) ]


inputStyle : List ( String, String )
inputStyle =
  [ ( "border", "none" )
  , ( "appearance", "none" )
  , ( "background-color", "rgba(0, 0, 0, 0)" )
  ]


titleFont : List ( String, String )
titleFont =
  [ ( "font-family", "futura, sans-serif" )
  , ( "color", "#66ACFF" )
  , ( "font-size", "2em" )
  ]
