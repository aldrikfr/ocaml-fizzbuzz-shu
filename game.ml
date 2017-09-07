open Functory.Cores
 let () =
   set_number_of_cores 4

type 'a engine_rules = {
     rules : (int -> 'a option) list ; default_rule : (int -> 'a) ;
     answer_agg : ('a -> 'a -> 'a) ; answer_empty : 'a}

let engine game number =
  let applyrule r = match (r number) with
    Some asw -> asw | None -> game.answer_empty in
  game.rules
  |> map_fold_a ~f:applyrule ~fold:game.answer_agg game.answer_empty
  |> fun s -> if s = game.answer_empty then game.default_rule number else s
