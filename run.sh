#!/bin/sh
watch -n 2 "ocamlfind ocamlc -o test -package Functory -package oUnit -linkpkg -g fizzbuzz.ml test.ml;./test"
