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



-- titleFont =
--   styles
--     [ fontFamilies [ "futura", "sans-serif" ]
--     , color (hex "66ACFF")
--     , fontSize (em 2)
--     ]
