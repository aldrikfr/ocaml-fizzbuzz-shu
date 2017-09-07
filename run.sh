#!/bin/sh
watch -n 2 "ocamlfind ocamlc -o test -package Functory -package oUnit -linkpkg -g game.ml fizzbuzz.ml test.ml;./test"
