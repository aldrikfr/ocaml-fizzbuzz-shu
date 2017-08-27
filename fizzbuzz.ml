open Functory

let multiple answer modnumber n =
  if n mod modnumber = 0 then Some answer else None

type 'a engine_rules = {
  rules : (int -> 'a option) list ; default_rule : (int -> 'a) ;
  answer_agg : ('a -> 'a -> 'a) ; answer_empty : 'a}

let fizzbuzzbang_rules = {
  rules = [multiple "Fizz" 3 ; multiple "Buzz" 5 ; multiple "Bang" 7];
  default_rule = string_of_int ;
  answer_agg = (^) ; answer_empty = ""}

let engine game number =
  let applyrule r = match (r number) with
   Some asw -> asw | None -> game.answer_empty in
  game.rules
  |> List.map applyrule
  |> List.fold_left game.answer_agg game.answer_empty
  |> fun s -> if s = game.answer_empty then game.default_rule number else s

let play = engine fizzbuzzbang_rules
