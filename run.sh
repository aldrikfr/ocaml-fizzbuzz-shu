#!/bin/sh
watch -n 2 "ocamlfind ocamlc -o test -package oUnit -linkpkg -g fizzbuzz.ml test.ml;./test"
