open OUnit2

let assert_numbers expected params =
		fun ctxt ->
		params
		|> List.iter (fun p -> assert_equal ~msg:("param:"^(string_of_int p)) expected (Fizzbuzz.play p))

let test_from_params = (fun (exp,params) -> exp >:: assert_numbers exp params)

let () =
	"FizzBuzzBang game" >:::(
		[("1",[1]) ;
		("Fizz",[3;6]) ;
		("Buzz",[5;10]) ;
		("Bang",[7;14]) ;
		("FizzBuzz",[15]) ;
		("FizzBuzzBang",[105])]
		|> List.map test_from_params)
	|> run_test_tt_main
