open Game
let multiple answer modnumber n =
  if n mod modnumber = 0 then Some answer else None

let play = {
  rules = [multiple "Fizz" 3 ; multiple "Buzz" 5; multiple "Bang" 7];
  default_rule = string_of_int ;
  answer_agg = (^) ; answer_empty = ""} |> engine
