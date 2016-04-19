module Stylesheets (..) where

import Css.File exposing (CssFileStructure)
import MyCss


port files : CssFileStructure
port files =
  Css.File.toFileStructure
    [ ( "public/css/styles.css", Css.File.compile MyCss.css ) ]
