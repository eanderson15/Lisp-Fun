(setq ext:*warn-on-redefinition* nil)+

(defun mod (x y)
	(cond
		((> 0 x) (+ x y))
		('t (mod (- x y) y))
	)
)

(defun floor (x y)
	(cond
		((> 0 x) -1)
		('t (+ 1 (floor (- x y) y)))
	)
)

(defun add3 (x) (+ x 3))

(defun lessthan3 (x) (< x 3))

(defun append (x y)
	(cond 
		((eq nil x) y)
		('t (cons (car x) (append (cdr x) y ) ))
	)
)

(defun reverse (x)
	(cond
		((eq nil x) x)
		('t (append (reverse (cdr x)) (cons (car x) '())) )
	)
)

(defun map (fn x)
	(cond
		((eq nil x) x)
		('t (cons (funcall fn (car x)) (map fn (cdr x))))
	)
)

(defun nub (x)
	(cond
		((eq nil x) x)
		('t (cond
			((member (car x) (cdr x)) (cons (car x) (nub (remove-all (car x) (cdr x)))))
			('t (cons (car x) (nub (cdr x))))
		))
	)
)

(defun fold (x fn y)
	(cond
		((eq nil (cdr y)) (funcall fn x (car y)))
		('t (fold (funcall fn x (car y)) fn (cdr y)))
	)
)

(defun filter (fn x)
	(cond
		((eq nil x) x)
		((funcall fn (car x)) (cons (car x) (filter fn (cdr x))))
		('t (filter fn (cdr x)))
	)
)

(defun merge (x y)
	(cond
		((eq nil x) y)
		((eq nil y) x)
		((> (car y) (car x)) (cons (car x) (merge (cdr x) y)))
		('t (cons (car y) (merge x (cdr y))))
	)
)

(defun addtoend (x y)
	(cond
		((eq nil y) (cons x '()))
		('t (cons (car y) (addtoend x (cdr y))))
	)
)

(defun indexof (x y)
	(cond
		((member x y) (+ 1 (indexof x (cdr y))))
		('t -1)
	)
)

(defun remove-all (x y)
	(cond
		((eq nil y) y)
		((eq x (car y)) (remove-all x (cdr y)))
		('t (cons (car y) (remove-all x (cdr y))))
	)
)

(defun member (x y)
	(cond
		((eq nil y) nil)
		('t (cond 
			((eq x (car y)) 't)
			('t (member x (cdr y)))
		))
	)
)

(defun insert (x y)
	(cond
		((member x y) y)
		('t (cons x y))
	)
)

(defun intersection (x y)
	(cond
		((eq nil x) x)
		('t (cond
			((member (car x) y) (cons (car x) (intersection (cdr x) y)))
			('t (intersection (cdr x) y))
		))
	)
)

(defun union (x y)
	(cond
		((eq nil y) x)
		('t (cond
			((member (car y) x) (union x (cdr y)))
			('t (union (append x (cons (car y) '())) (cdr y)))
		))
	)
)

(defun difference (x y)
	(cond
		((eq nil x) x)
		((member (car x) y) (difference (cdr x) y))
		('t (cons (car x) (difference (cdr x) y)))
	)
)

(defun symdiff (x y)
	(append (difference x y) (difference y x))
)

(defun subsetp (x y)
	(cond
		((eq nil x) 't)
		((member (car x) y) (subsetp (cdr x) y))
		('t nil)
	)
)

(defun supersetp (x y)
	(subsetp y x)
)

(defun cardinality (x)
	(cond
		((eq nil x) 0)
		('t (+ 1 (cardinality (cdr x))))
	)
)

(defun poweradd (x y)
	(poweraddrec x y y)
)

(defun poweraddrec (x y z)
	(cond
		((eq nil z) (addtoend (cons x z) (cons z '())))
		((eq nil (cdr z)) (addtoend (cons x (car z)) y))
		('t (poweraddrec x (addtoend (cons x (car z)) y) (cdr z)))
	)
)

(defun powerset (x)
	(cond
		((eq nil x) x)
		('t (poweradd (car x) (powerset (cdr x))))
	)
)

(defun abs (x)
	(cond
		((< 0 x) x)
		('t (- 0 x))
	)
)

(defun factorial (x)
	(cond
		((= 0 x) 1)
		('t (* x (factorial (- x 1))))
	)
)

(defun right-tri (x y z)
	(cond
		((= 0 (- (+ (* x x) (* y y)) (* z z))) 't)
		('t nil)
	)
)

(defun gcd (x y)
	(cond
		((= 0 (mod (abs y) (abs x))) x)
		('t (gcd (mod (abs y) (abs x)) x))
	)
)

(defun lcm (x y)
	(/ (* x y) (gcd x y))
)

(defun nth-fibo (x)
	(cond
		((> 1 x) 0)
		((= 1 x) 1)
		('t (+ (nth-fibo (- x 1)) (nth-fibo (- x 2))))
	)
)

(defun primeprec (x y)
	(cond
		((= 1 y) 't)
		((= 0 (mod x y)) nil)
		('t (primeprec x (- y 1)))
	)
)

(defun primep (x)
	(cond
		((= 1 (abs x)) nil)
		('t (primeprec (abs x) (floor x 2)))
	)
)

(defun nth-primerec (x y z)
	(cond
		((= y z) (- x 1))
		((primep x) (nth-primerec (+ x 1) y (+ z 1)))
		('t (nth-primerec (+ x 1) y z))
	)
)

(defun nth-prime (x)
	(cond
		((= 0 x) 0)
		((= 1 (abs x)) 2)
		('t (nth-primerec 2 (abs x) 0))
	)
)
		
(defun factorsum (x y)
	(cond
		((= 1 y) 1)
		((= x y) (factorsum x (- y 1)))
		((= 0 (mod x y)) (+ y (factorsum x (- y 1))))
		('t (factorsum x (- y 1)))
	)
)

(defun perfectp (x)
	(cond
		((= (abs x) (factorsum (abs x) (floor (abs x) 2))) 't)
		('t nil)
	)
)

(defun abundantp (x)
	(cond
		((< (abs x) (factorsum (abs x) (floor (abs x) 2))) 't)
		('t nil)
	)
)

(defun deficientp (x)
	(cond
		((> (abs x) (factorsum (abs x) (floor (abs x) 2))) 't)
		('t nil)
	)
)

(defun REPL (fn)
	(setf y (make-array '(30) :initial-contents '(append reverse map nub fold filter merge addtoend indexof remove-all member insert intersection union difference symdiff subsetp supersetp cardinality abs factorial right-tri gcd lcm nth-fibo primep nth-prime perfectp abundantp deficientp)))
	(setq x 0)
	(loop
		(format t "Enter a list of arguments for ~A (NIL to skip): ~%" fn)
		(setq z (read))
		(cond
			((eq nil z) (return 't))
			('t (handler-case (format t "~A ~A => ~A ~%" fn z (apply fn z))
				(error (c) (format t "Invalid input ~%"))
			))
		)
	)
)

(format t "~%List functions ~%~%")

(format t "~A ~A => ~A ~%" 'append "((1 3 x a) (4 2 b))" (append '(1 3 x a) '(4 2 b)))
(REPL 'append)

(format t "~A ~A => ~A ~%" 'reverse "((a b c d))" (reverse '(a b c d)))
(REPL 'reverse)

(format t "~A ~A ~A => ~A ~%" 'map "(add3" "(1 2 3 4))" (map 'add3 '(1 2 3 4)))
(REPL 'map)

(format t "~A ~A => ~A ~%" 'nub "((1 1 2 4 1 2 5))" (nub '(1 1 2 4 1 2 5)))
(REPL 'nub)

(format t "~A ~A ~A ~A => ~A ~%" 'fold "(10" "-" "(1 3 2))" (fold 10 '- '(1 3 2)))
(REPL 'fold)

(format t "~A ~A ~A => ~A ~%" 'filter "(lessthan3" "(1 4 5 2 1 6))" (filter 'lessthan3 '(1 4 5 2 1 6)))
(REPL 'filter)

(format t "~A ~A => ~A ~%" 'merge "((1 3 4 7) (2 3 6))" (merge '(1 3 4 7) '(2 3 6)))
(REPL 'merge)

(format t "~A ~A ~A => ~A ~%" 'addtoend "(d" "(a b c))" (addtoend 'd '(a b c)))
(REPL 'addtoend)

(format t "~A ~A ~A => ~A ~%" 'indexof "(a" "(b c a d))" (indexof 'a '(b c a d)))
(format t "~A ~A ~A => ~A ~%" 'indexof "(a" "(b c d f))" (indexof 'a '(b c d f)))
(REPL 'indexof)

(format t "~A ~A ~A => ~A ~%" 'remove-all "(a" "(b a c a a d a))" (remove-all 'a '(b a c a a d a)))
(REPL 'remove-all)

(format t "~%Set functions ~%~%")

(format t "~A ~A ~A => ~A ~%" 'member "(a" "(b c a d))" (member 'a '(b c a d)))
(format t "~A ~A ~A => ~A ~%" 'member "(z" "(b c a d))" (member 'z '(b c a d)))
(REPL 'member)

(format t "~A ~A ~A => ~A ~%" 'insert "(a" "(b c d))" (insert 'a '(b c d)))
(format t "~A ~A ~A => ~A ~%" 'insert "(a" "(a b c d))" (insert 'a '(a b c d)))
(REPL 'insert)

(format t "~A ~A => ~A ~%" 'intersection "((a b c) (a c d))" (intersection '(a b c) '(a c d)))
(REPL 'intersection)

(format t "~A ~A => ~A ~%" 'union "((a b c) (a c d))" (union '(a b c) '(a c d)))
(REPL 'union)

(format t "~A ~A => ~A ~%" 'difference "((a b c) (a c d))" (difference '(a b c) '(a c d)))
(format t "~A ~A => ~A ~%" 'difference "((a c d) (a b c))" (difference '(a c d) '(a b c)))
(REPL 'difference)

(format t "~A ~A => ~A ~%" 'symdiff "((a b c) (a c d))" (symdiff '(a b c) '(a c d)))
(REPL 'symdiff)

(format t "~A ~A => ~A ~%" 'subsetp "((a b) (a b c d))" (subsetp '(a b) '(a b c d)))
(format t "~A ~A => ~A ~%" 'subsetp "((a b q) (a b c d))" (subsetp '(a b q) '(a b c d)))
(REPL 'subsetp)

(format t "~A ~A => ~A ~%" 'supersetp "((a b c d) (a b))" (supersetp '(a b c d) '(a b)))
(format t "~A ~A => ~A ~%" 'supersetp "((a b c d) (a q b))" (supersetp '(a b c d) '(a q b)))
(REPL 'supersetp)

(format t "~A ~A => ~A ~%" 'cardinality "((a b c))" (cardinality '(a b c)))
(REPL 'cardinality)

(format t "~A ~A => ~A ~%" 'powerset "((a b c))" (powerset '(a b c)))
(REPL 'powerset)

(format t "~%Math functions ~%~%")

(format t "~A ~A => ~A ~%" 'abs "(-7)" (abs -7))
(format t "~A ~A => ~A ~%" 'abs "(7)" (abs 7))
(REPL 'abs)

(format t "~A ~A => ~A ~%" 'factorial "(5)" (factorial 5))
(REPL 'factorial)

(format t "~A ~A => ~A ~%" 'right-tri "(3 4 5)" (right-tri 3 4 5))
(format t "~A ~A => ~A ~%" 'right-tri "(1 2 3)" (right-tri 1 2 3))
(REPL 'right-tri)

(format t "~A ~A => ~A ~%" 'gcd "(8 12)" (gcd 8 12))
(REPL 'gcd)

(format t "~A ~A => ~A ~%" 'lcm "(4 6)" (lcm 4 6))
(REPL 'lcm)

(format t "~A ~A => ~A ~%" 'nth-fibo "(6)" (nth-fibo 6))
(format t "~A ~A => ~A ~%" 'nth-fibo "(10)" (nth-fibo 10))
(REPL 'nth-fibo)

(format t "~A ~A => ~A ~%" 'primep "(1)" (primep 1))
(format t "~A ~A => ~A ~%" 'primep "(2)" (primep 2))
(format t "~A ~A => ~A ~%" 'primep "(4)" (primep 4))
(format t "~A ~A => ~A ~%" 'primep "(5)" (primep 5))
(format t "~A ~A => ~A ~%" 'primep "(10)" (primep 10))
(format t "~A ~A => ~A ~%" 'primep "(11)" (primep 11))
(format t "~A ~A => ~A ~%" 'primep "(101)" (primep 101))
(REPL 'primep)

(format t "~A ~A => ~A ~%" 'nth-prime "(1)" (nth-prime 1))
(format t "~A ~A => ~A ~%" 'nth-prime "(2)" (nth-prime 2))
(format t "~A ~A => ~A ~%" 'nth-prime "(3)" (nth-prime 3))
(format t "~A ~A => ~A ~%" 'nth-prime "(4)" (nth-prime 4))
(format t "~A ~A => ~A ~%" 'nth-prime "(5)" (nth-prime 5))
(format t "~A ~A => ~A ~%" 'nth-prime "(6)" (nth-prime 6))
(format t "~A ~A => ~A ~%" 'nth-prime "(26)" (nth-prime 26))
(REPL 'nth-prime)

(format t "~%Required functions ~%~%")

(format t "~A ~A => ~A ~%" 'perfectp "(5)" (perfectp 5))
(format t "~A ~A => ~A ~%" 'perfectp "(6)" (perfectp 6))
(format t "~A ~A => ~A ~%" 'perfectp "(36)" (perfectp 36))
(format t "~A ~A => ~A ~%" 'perfectp "(496)" (perfectp 496))
(REPL 'perfectp)

(format t "~A ~A => ~A ~%" 'abundantp "(5)" (abundantp 5))
(format t "~A ~A => ~A ~%" 'abundantp "(12)" (abundantp 12))
(REPL 'abundantp)

(format t "~A ~A => ~A ~%" 'deficientp "(5)" (deficientp 5))
(format t "~A ~A => ~A ~%" 'deficientp "(12)" (deficientp 12))
(REPL 'deficientp)

(format t "~% Thanks for playing ~%")