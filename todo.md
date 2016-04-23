

##To learn:

1) how to style hover states and stuff
use Html.Events to update state. Maybe put styles in the model to update them?
But what happens when I update a style like inputBackground and it changes all of them,
not just the one hovered on?

Use elm-css because it has everything i want and it makes css type checked.


2) abstract update function to apply to all tables. can use input field name to equal
record name so jobs and schools are properly location in update.

3) How to dynamically update records. Example"

record = {john = 5, matt = 10}

function dynamicField =
  {record | dynamicField = 13}

Can do something like this with Dict but lose type safety.


4) Create an elm function to auto grow textarea. Could use one of
a million js libs, but better to stay in elm.
