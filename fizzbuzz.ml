let modulo answer modnumber n =
  if n mod modnumber = 0 then Some answer else None

let engine ~empty ~f_agg ~rules ~defaultrule userinfo =
  let applyrule r = match (r userinfo) with Some answer -> answer | None -> empty in
  rules
  |> List.map applyrule
  |> List.fold_left f_agg empty
  |> fun s -> if s = empty then defaultrule userinfo else s

let play = engine "" (^) [modulo "Fizz" 3 ; modulo "Buzz" 5 ; modulo "Bang" 7] string_of_int
