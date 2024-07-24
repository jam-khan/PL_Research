Definition [Terms, Inductively]: The set of terms is the smallest set D s.t.
1. {true,false,0} is a subset of D.
2. if t1 is in D, then {succ t1, pred t1, iszero t1} is a subset of D.
3. if t1, t2, t3 in D, then if t1 then t2 else t3 is a subset of D.


inference rule format "natural deduction style"

Definition [Terms, By Inference rules]

true in D           false in D          0 in D

  t1 in D           t1 in D                t1 in D
------------      ------------         --------------
succ t1 in D      pred t1 in D         iszero t1 in D

        t1 in D     t2 in D     t3 in D
        -------------------------------
           if t1 then t2 else t3 in D



Another definition style is "concrete" stype

S_0         = null_set
S_i + 1     =   {true, false, 0}
              U {succ t1, pred t1, iszero t1 | t1 in S_i}
              U {if t1 then t2 else t3       | t1, t2, t3 in S_i}

let
S = union over i (S_i)

3.2.4 Exercise[**]: 

|S_0| = 0
|S_1| = 3
|S_2| = 3 + 3 * 3 + 3 * 3 * 3 = 39
|S_3| = 3 + 3 * 39 + 39 * 39 * 39 = 59439

General formula = 3 + 3 * |S_i| + |S_i|^3


3.2.5 Exercise[**]:

By induction,

let S_i - 1 be subset of S_i for all i <= n
S_i     =   {true, false, 0}
              U {succ t1, pred t1, iszero t1 | t1 in S_i - 1, S_i - 2, ..., S_0}
              U {if t1 then t2 else t3       | t1, t2, t3 in S_i - 1, S_i - 2, ..., S_0}

then, we need to show that S_n is a subset of S_n + 1 for 

S_i + 1     =   {true, false, 0}
              U {succ t1, pred t1, iszero t1 | t1 in S_i}
              U {if t1 then t2 else t3       | t1, t2, t3 in S_i}

=>
S_i + 1     =   {true, false, 0}
              U {succ t1, pred t1, iszero t1 | t1 in S_i, S_i - 1, ..., S_0}
              U {if t1 then t2 else t3       | t1, t2, t3 in S_i, S_i - 1,...,S_0}

S_i + 1 = {true, false, 0} U
            S_i + 1     =   
              {true, false, 0}
              U {succ t1, pred t1, iszero t1 | t1 in S_i - 1, ..., S_0}
              U {if t1 then t2 else t3       | t1, t2, t3 in S_i - 1, ...,S_0}

              U {succ t1, pred t1, iszero t1 | t1 in S_i}
              U {if t1 then t2 else t3       | t1, t2, t3 in S_i}
            
            = S_i   U {succ t1, pred t1, iszero t1 | t1 in S_i}
                    U {if t1 then t2 else t3       | t1, t2, t3 in S_i}
=>
S_i is a subset of S_i + 1


Definition 3.3.1: Consts(t) as the set of constants appearing in a term t.

Consts(true)                    = {true}
Consts(false)                   = {false}
Consts(0)                       = {0}
Consts(succ t1)                 = Consts(t1)
Consts(pred t1)                 = Consts(t1)
Consts(iszero t1)               = Consts(t1)
Consts(if t1 then t2 else t3)   = Consts(t1) U Consts(t2) U Consts(t3)


Definition 3.3.2: The size of a term t, written size(t), is defined as follows:
size(true)                  = 1
size(false)                 = 1
size(0)                     = 1
size(succ t1)               = size(t1) + 1
size(pred t1)               = size(t1) + 1
size(iszero t1)             = size(t1) + 1
size(if t1 then t2 else t3) = size(t1) + size(t2) + size(t3) + 1


depth(true)                  = 1
depth(false)                 = 1
depth(0)                     = 1
depth(succ t1)               = depth(t1) + 1
depth(pred t1)               = depth(t1) + 1
depth(iszero t1)             = depth(t1) + 1
depth(if t1 then t2 else t3) = max(depth(t1),depth(t2), depth(t3)) + 1


3.3.3
Lemma: The number of distinct constants in a term t is no greater than the size of t (i.e., |Consts(t)| ≤ size(t)).