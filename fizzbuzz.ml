let modulo answer modnumber n =
  if n mod modnumber = 0 then Some answer else None

type 'a engine_rules = {
  rules : (int -> 'a option) list ; default_rule : (int -> 'a) ;
  answer_agg : ('a -> 'a -> 'a) ; empty : 'a
}

let fizzbuzzbang_r = {
  rules = [modulo "Fizz" 3;modulo "Buzz" 5;modulo "Bang" 7];
  default_rule = string_of_int ;
  answer_agg = (^) ;
  empty = ""
}

let engine game number =
  let applyrule r = match (r number) with
   Some asw -> asw | None -> game.empty in
  game.rules
  |> List.map applyrule
  |> List.fold_left game.answer_agg game.empty
  |> fun s -> if s = game.empty then game.default_rule number else s

let play = engine fizzbuzzbang_r
