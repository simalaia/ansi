#! /usr/bin/env ocaml
open Printf

(* Experiments in doing ansi escapes in Ocaml, can't remember why.  Not convinded this is the best way to go about things really. *)

let rec range a b =
  if a > b then []
  else a :: range (a+1) b;;

let esc    = "\u{1b}["   (* This is an interesting notation *)
let reset  = esc ^ "0m"
let bright = ";1m"
let fore   = "3"
let back   = "4"

let black  = 0 let red     = 1
let green  = 2 let yellow  = 3
let blue   = 4 let magenta = 5
let cyan   = 6 let white   = 7

let cold d r = esc ^ r ^ (string_of_int d) ^ "m"
let colb d r = esc ^ r ^ (string_of_int d) ^ bright;;



(* 256 colours *)
let p = (fun r -> printf "\u{1b}[48;5;%im%3i " r r) in
let f = (fun r ->
          p r; if r mod 16 = 0 then
                 (printf "\u{1b}[0m\n"; r)
               else r) in
List.map f (range 0 255);
printf "\u{1b}[0m\n";;
