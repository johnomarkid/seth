module Utils (..) where


fromJust : Maybe a -> a
fromJust x =
  case x of
    Just y ->
      y

    Nothing ->
      Debug.crash "error: fromJust Nothing"
