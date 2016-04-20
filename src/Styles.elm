module Styles (..) where


inputStyle : List ( String, String )
inputStyle =
  [ ( "border", "none" )
  , ( "appearance", "none" )
  , ( "background-color", "rgba(0, 0, 0, 0)" )
  ]


titleFont : List ( String, String )
titleFont =
  [ ( "font-families", "futura, sans-serif" )
  , ( "color", "#66ACFF" )
  , ( "font-size", "2em" )
  ]


panelBackground : List ( String, String )
panelBackground =
  [ ( "background-color", "#F8F8F8" )
  , ( "box-shadow", "0px 1px 4px rgba(209, 202, 202, 0.5)" )
  , ( "padding", "10px 30px 10px 30px" )
  ]


panelInnerDiv : List ( String, String )
panelInnerDiv =
  []


panelTable : List ( String, String )
panelTable =
  [ ( "padding-left", "0px" ) ]


panelLine : List ( String, String )
panelLine =
  [ ( "margin", "0px 0px 30px 0px" ) ]


panelHeader : List ( String, String )
panelHeader =
  [ ( "font-weight", "normal" )
  , ( "font-size", "24px" )
  ]


panelItemHeader : List ( String, String )
panelItemHeader =
  [ ( "font-size", "18px" )
  , ( "color", "#66ACFF" )
  , ( "width", "100%" )
  ]


panelDescription : List ( String, String )
panelDescription =
  [ ( "font-size", "14px" )
  , ( "width", "100%" )
  ]
