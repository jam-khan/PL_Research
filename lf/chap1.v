From Coq Require Export String.

Inductive day : Type :=
  | monday
  | tuesday
  | wednesday
  | thursday
  | friday
  | saturday
  | sunday.

(* Below function will match day to the next day *)

(* Coq can figure out the data types of 
the arguments and return types using type inference but
it is good to write them explicity for readability purposes *)

Definition next_weekday (d:day) : day :=
    match d with
    | monday => tuesday
    | tuesday => wednesday
    | wednesday => thursday
    | thursday => friday
    | friday => monday
    | saturday => monday
    | sunday => monday
    end.


(* Enumerated Data Types 
    Most of the types which are primitive data types in other
    languages are instances of defined data types.
*)

(* Checking if the function works in the Coq *)

(* 1. Using Compute to evaluate an expression *)

Compute (next_weekday friday).
Compute (next_weekday (next_weekday saturday)).

(* 2. Using a Coq example which makes an assetion and gives it a name *)
Example test_next_weekday1:
    (next_weekday (next_weekday saturday)) = tuesday.

(* Below asks the coq to prove the above assertion *)
(* It states that above assertion can be proved by both
sides evaluating to the same thing. *)
Proof. simpl. reflexivity. Qed.




(* Defining Data Types *)
Inductive bool : Type :=
    | true
    | false.

Definition negb (b:bool) : bool :=
    match b with
    |   true  => false
    |   false => true
    end.

Definition andb (b1:bool) (b2:bool) : bool :=
    match b1 with
    |   true    => b2
    |   false   => true
    end.

Definition orb (b1:bool) (b2:bool) : bool :=
    match b1 with
    | true => true
    | false => b2
    end.

Example test_orb1: (orb true false) = true.
Proof. simpl. reflexivity. Qed.
Example test_orb2: (orb false false) = false.
Proof. simpl. reflexivity. Qed.
Example test_orb3: (orb false true) = true.
Proof. simpl. reflexivity. Qed.
Example test_orb4: (orb true true) = true.
Proof. simpl. reflexivity. Qed.

(* Notation command can help define 
infix syntax for the boolean operators *)

Notation "x && y" := (andb x y).
Notation "x || y" := (orb x y).

Example test_orb5: false || false || true = true.
Proof. simpl. reflexivity. Qed.

(* Conditional Expressions *)

Definition negb' (b:bool) : bool :=
    if b then false
    else true.

Example test_negb': (negb' false) = true.
Proof. simpl. reflexivity. Qed.


Definition andb' (b1: bool) (b2: bool) : bool :=
    if b1 then b2
    else false.

Example test_andb': (andb' false true) = false.
Proof. simpl. reflexivity. Qed.

Definition orb' (b1: bool) (b2: bool) : bool :=
    if b1 then true
    else b2.

Example test_orb': (orb' true true) = true.
Proof. simpl. reflexivity. Qed.

(* Interesting fact on conditional expressions in coq:
    -- Coq supports conditional expressions over any inductively defined
    type with exactly two clauses in its definition. 

    The guard is considered true if it evaluates to the constructor
    of the first clause of the Inductive definition and false if it evaluates to the second
*)

Inductive test_type : Type :=
    |   love
    |   no_love.

Definition test_or' (b1: test_type) (b2: test_type) : bool :=
    if b1 then true
    else false.

Example test_orb1': (test_or' no_love no_love) = false.
Proof. simpl. reflexivity. Qed.







