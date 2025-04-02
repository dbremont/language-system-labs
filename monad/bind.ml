(* First, let's define the Option bind operator *)
let (>>=) opt f = match opt with
  | Some x -> f x
  | None -> None

(* Example 1: Basic usage with Option type *)
let divide x y =
  if y = 0 then None
  else Some (x / y)

let compute_result x y z =
  Some x >>= fun a ->
  divide a y >>= fun b ->
  divide b z

(* Example usage with printing *)
let result1 = compute_result 20 2 5
let () = match result1 with
  | Some x -> Printf.printf "Result 1: %d\n" x  (* Prints: Result 1: 2 *)
  | None -> Printf.printf "Result 1: None\n"

let result2 = compute_result 20 0 5
let () = match result2 with
  | Some x -> Printf.printf "Result 2: %d\n" x
  | None -> Printf.printf "Result 2: None\n"  (* Prints: Result 2: None *)

(* Example 2: List bind operator *)
let (>>=) lst f = List.concat (List.map f lst)

(* Example usage with lists *)
let double x = [x; x]
let add_one x = [x + 1]

let combined = [1; 2; 3] >>= double >>= add_one
let () = 
  Printf.printf "Combined list: ";
  List.iter (Printf.printf "%d ") combined;
  print_newline ()
  (* Prints: Combined list: 2 2 3 3 4 4 *)

(* Example 3: Result bind operator *)
type ('a, 'e) result = Ok of 'a | Error of 'e

let (>>=) result f = match result with
  | Ok x -> f x
  | Error e -> Error e

let safe_sqrt x =
  if x >= 0.0 then Ok (sqrt x)
  else Error "Cannot take square root of negative number"

let safe_reciprocal x =
  if x <> 0.0 then Ok (1.0 /. x)
  else Error "Cannot divide by zero"

let compute x =
  safe_sqrt x >>= fun root ->
  safe_reciprocal root

(* Example usage with printing *)
let result3 = compute 16.0
let () = match result3 with
  | Ok x -> Printf.printf "Result 3: %.3f\n" x  (* Prints: Result 3: 0.250 *)
  | Error e -> Printf.printf "Result 3: Error - %s\n" e

let result4 = compute (-1.0)
let () = match result4 with
  | Ok x -> Printf.printf "Result 4: %.3f\n" x
  | Error e -> Printf.printf "Result 4: Error - %s\n" e  
  (* Prints: Result 4: Error - Cannot take square root of negative number *)