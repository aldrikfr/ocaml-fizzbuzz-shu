open Functory.Cores
 let () =
   set_number_of_cores 4
let list_map_reduce ~map ~reduce neutral = map_fold_a ~f:map ~fold:reduce neutral

type 'a engine_rules = {
     rules : (int -> 'a option) list ; default_rule : (int -> 'a) ;
     f_aggregate : ('a -> 'a -> 'a) ; empty : 'a}

let engine game number =
  let applyrule r = match (r number) with
    Some asw -> asw | None -> game.empty in
  game.rules
  |> list_map_reduce ~map:applyrule ~reduce:game.f_aggregate game.empty
  |> fun s -> if s = game.empty then game.default_rule number else s
