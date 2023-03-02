All code is in project3.lisp

Running project3.lisp will run the required test cases and then prompt the user for input for the current function.
Upon input (if it is valid), the function name, input, and output will be printed.
The user will be prompted for more input in a loop.
Entering nil will skip to the next function.

Input must be entered as a list.
If given an invalid input, will print "Invalid input" and continue.
If stack overflows, program breaks.

Full example output with given test cases at bottom.

Four functions at top of project3.lisp:
	- mod (x y), my recursive implementation of the mod function
	- floor (x y), my recursive implementation of floor division
	- add3 (x)
	- lessthan3 (x)

Function arguments:
	-gcd (x y) - x must be smaller than y
	-lcm (x y) - x must be smaller than y
	-factorial (x) - doesn't work for negative numbers

Functions with stack overflow / run-time hiccups:
	-gcd (x y) - stack overflow with values getting into the 3000s because of the use of the mod function, works on (8 3001)
	-lcm (x y) - stack overflow if the number gets high enough, not sure how high this one can go
	-nth-fibo (x) - run time starts to get compromised > 25, at 40 it took longer than a minute before I quit
	-primep (x) - stack overflow with values getting into high 3000s because of the use of the mod function, highest prime tested that works (3581)
	-nth-prime (x) - run time starts to get compromised > 120
		       - stack overflow with values getting into high 200s because of the use of the mod function, highest tested that works (250)
	-perfectp, abundantp, deficientp - stack overflow with values getting into high 3000s because of the use of the mod function, works on (3500),
	                                   highest perfect number that works is 496


Example output:

(load "project3")

APPEND ((1 3 x a) (4 2 b)) => (1 3 X A 4 2 B)
Enter a list of arguments for APPEND (NIL to skip):
((a b c) (d e f))
APPEND ((A B C) (D E F)) => (A B C D E F)
Enter a list of arguments for APPEND (NIL to skip):
nil
REVERSE ((a b c d)) => (D C B A)
Enter a list of arguments for REVERSE (NIL to skip):
((g h i j k))
REVERSE ((G H I J K)) => (K J I H G)
Enter a list of arguments for REVERSE (NIL to skip):
nil
MAP (add3 (1 2 3 4)) => (4 5 6 7)
Enter a list of arguments for MAP (NIL to skip):
(add 3 (4 5 6 7))
Invalid input
Enter a list of arguments for MAP (NIL to skip):
(add3 (4 5 6 7))
MAP (ADD3 (4 5 6 7)) => (7 8 9 10)
Enter a list of arguments for MAP (NIL to skip):
nil
NUB ((1 1 2 4 1 2 5)) => (1 2 4 5)
Enter a list of arguments for NUB (NIL to skip):
((6 6 7 8 8 9))
NUB ((6 6 7 8 8 9)) => (6 7 8 9)
Enter a list of arguments for NUB (NIL to skip):
nil
FOLD (10 - (1 3 2)) => 4
Enter a list of arguments for FOLD (NIL to skip):
(10 + (1 3 2))
FOLD (10 + (1 3 2)) => 16
Enter a list of arguments for FOLD (NIL to skip):
nil
FILTER (lessthan3 (1 4 5 2 1 6)) => (1 2 1)
Enter a list of arguments for FILTER (NIL to skip):
(lessthan3 (-2 -1 0 1 2 3 4))
FILTER (LESSTHAN3 (-2 -1 0 1 2 3 4)) => (-2 -1 0 1 2)
Enter a list of arguments for FILTER (NIL to skip):
nil
MERGE ((1 3 4 7) (2 3 6)) => (1 2 3 3 4 6 7)
Enter a list of arguments for MERGE (NIL to skip):
((1 2 3) (0 1 2))
MERGE ((1 2 3) (0 1 2)) => (0 1 1 2 2 3)
Enter a list of arguments for MERGE (NIL to skip):
nil
ADDTOEND (d (a b c)) => (A B C D)
Enter a list of arguments for ADDTOEND (NIL to skip):
(a (a b c d))
ADDTOEND (A (A B C D)) => (A B C D A)
Enter a list of arguments for ADDTOEND (NIL to skip):
nil
INDEXOF (a (b c a d)) => 2
INDEXOF (a (b c d f)) => -1
Enter a list of arguments for INDEXOF (NIL to skip):
(y (q r s t u v w x y z))
INDEXOF (Y (Q R S T U V W X Y Z)) => 8
Enter a list of arguments for INDEXOF (NIL to skip):
nil
REMOVE-ALL (a (b a c a a d a)) => (B C D)
Enter a list of arguments for REMOVE-ALL (NIL to skip):
(g (i g a t g e g f g o o g d))
REMOVE-ALL (G (I G A T G E G F G O O G D)) => (I A T E F O O D)
Enter a list of arguments for REMOVE-ALL (NIL to skip):
nil
MEMBER (a (b c a d)) => T
MEMBER (z (b c a d)) => NIL
Enter a list of arguments for MEMBER (NIL to skip):
(h (h o t))
MEMBER (H (H O T)) => T
Enter a list of arguments for MEMBER (NIL to skip):
nil
INSERT (a (b c d)) => (A B C D)
INSERT (a (a b c d)) => (A B C D)
Enter a list of arguments for INSERT (NIL to skip):
(h (o t))
INSERT (H (O T)) => (H O T)
Enter a list of arguments for INSERT (NIL to skip):
nil
INTERSECTION ((a b c) (a c d)) => (A C)
Enter a list of arguments for INTERSECTION (NIL to skip):
((h o t) (c o l d))
INTERSECTION ((H O T) (C O L D)) => (O)
Enter a list of arguments for INTERSECTION (NIL to skip):
nil
UNION ((a b c) (a c d)) => (A B C D)
Enter a list of arguments for UNION (NIL to skip):
((h o t) (c o l d))
UNION ((H O T) (C O L D)) => (H O T C L D)
Enter a list of arguments for UNION (NIL to skip):
nil
DIFFERENCE ((a b c) (a c d)) => (B)
DIFFERENCE ((a c d) (a b c)) => (D)
Enter a list of arguments for DIFFERENCE (NIL to skip):
((h o t) (c o l d))
DIFFERENCE ((H O T) (C O L D)) => (H T)
Enter a list of arguments for DIFFERENCE (NIL to skip):
nil
SYMDIFF ((a b c) (a c d)) => (B D)
Enter a list of arguments for SYMDIFF (NIL to skip):
((h o t) (c o l d))
SYMDIFF ((H O T) (C O L D)) => (H T C L D)
Enter a list of arguments for SYMDIFF (NIL to skip):
nil
SUBSETP ((a b) (a b c d)) => T
SUBSETP ((a b q) (a b c d)) => NIL
Enter a list of arguments for SUBSETP (NIL to skip):
((h o t) (h o t t e r))
SUBSETP ((H O T) (H O T T E R)) => T
Enter a list of arguments for SUBSETP (NIL to skip):
nil
SUPERSETP ((a b c d) (a b)) => T
SUPERSETP ((a b c d) (a q b)) => NIL
Enter a list of arguments for SUPERSETP (NIL to skip):
((h o t) (h o t t e r))
SUPERSETP ((H O T) (H O T T E R)) => NIL
Enter a list of arguments for SUPERSETP (NIL to skip):
nil
CARDINALITY ((a b c)) => 3
Enter a list of arguments for CARDINALITY (NIL to skip):
((h o t t e r))
CARDINALITY ((H O T T E R)) => 6
Enter a list of arguments for CARDINALITY (NIL to skip):
nil
POWERSET ((a b c)) => (NIL (C) (B) (B C) (A) (A C) (A B) (A B C))
Enter a list of arguments for POWERSET (NIL to skip):
((a b c d))
POWERSET ((A B C D)) => (NIL (D) (C) (C D) (B) (B D) (B C) (B C D) (A) (A D) (A C) (A C D) (A B) (A B D) (A B C) (A B C D))
Enter a list of arguments for POWERSET (NIL to skip):
nil
ABS (-7) => 7
ABS (7) => 7
Enter a list of arguments for ABS (NIL to skip):
(8)
ABS (8) => 8
Enter a list of arguments for ABS (NIL to skip):
nil
FACTORIAL (5) => 120
Enter a list of arguments for FACTORIAL (NIL to skip):
(7)
FACTORIAL (7) => 5040
Enter a list of arguments for FACTORIAL (NIL to skip):
nil
RIGHT-TRI (3 4 5) => T
RIGHT-TRI (1 2 3) => NIL
Enter a list of arguments for RIGHT-TRI (NIL to skip):
(5 12 13)
RIGHT-TRI (5 12 13) => T
Enter a list of arguments for RIGHT-TRI (NIL to skip):
nil
GCD (8 12) => 4
Enter a list of arguments for GCD (NIL to skip):
(20 54)
GCD (20 54) => 2
Enter a list of arguments for GCD (NIL to skip):
nil
LCM (4 6) => 12
Enter a list of arguments for LCM (NIL to skip):
(301 456)
LCM (301 456) => 137256
Enter a list of arguments for LCM (NIL to skip):
nil
NTH-FIBO (6) => 8
NTH-FIBO (10) => 55
Enter a list of arguments for NTH-FIBO (NIL to skip):
(22)
NTH-FIBO (22) => 17711
Enter a list of arguments for NTH-FIBO (NIL to skip):
nil
PRIMEP (1) => T
PRIMEP (2) => T
PRIMEP (4) => NIL
PRIMEP (5) => T
PRIMEP (10) => NIL
PRIMEP (11) => T
PRIMEP (101) => T
Enter a list of arguments for PRIMEP (NIL to skip):
(37)
PRIMEP (37) => T
Enter a list of arguments for PRIMEP (NIL to skip):
nil
NTH-PRIME (1) => 2
NTH-PRIME (2) => 3
NTH-PRIME (3) => 5
NTH-PRIME (4) => 7
NTH-PRIME (5) => 11
NTH-PRIME (6) => 13
NTH-PRIME (26) => 101
Enter a list of arguments for NTH-PRIME (NIL to skip):
(100)
NTH-PRIME (100) => 541
Enter a list of arguments for NTH-PRIME (NIL to skip):
nil
PERFECTP (5) => NIL
PERFECTP (6) => T
PERFECTP (36) => NIL
PERFECTP (496) => T
Enter a list of arguments for PERFECTP (NIL to skip):
(2000)
PERFECTP (2000) => NIL
Enter a list of arguments for PERFECTP (NIL to skip):
nil
ABUNDANTP (5) => NIL
ABUNDANTP (12) => T
Enter a list of arguments for ABUNDANTP (NIL to skip):
(2000)
ABUNDANTP (2000) => T
Enter a list of arguments for ABUNDANTP (NIL to skip):
nil
DEFICIENTP (5) => T
DEFICIENTP (12) => NIL
Enter a list of arguments for DEFICIENTP (NIL to skip):
(2000)
DEFICIENTP (2000) => NIL
Enter a list of arguments for DEFICIENTP (NIL to skip):
nil
T
