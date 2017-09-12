open Game
let multiple modnumber answer n =
  if n mod modnumber = 0 then Some answer else None

let play = {
  rules = [multiple 3 "Fizz" ; multiple 5 "Buzz" ; multiple 7 "Bang"] ;
  default_rule = string_of_int ;
  f_aggregate = (^) ; empty = ""} |> engine
