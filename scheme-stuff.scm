(define factorial
  (lambda (n)
    (cond
      ((or (= n 0) (= n 1)) 1)
      (else
       (* n (factorial (- n 1)))))))

(define joke
  (lambda (n)
    (cond
      ((if (= n 1) (+ 2 2) 'wrong))
      (else
       (* n 5)))))

(define grade
  (lambda (x)
    (cond
      ((>= x 90) 'A)
      ((>= x 80) 'B)
      ((>= x 70) 'C)
      (else 'failed)
      )))

(define grd
  (lambda (n)
    (case n
      ((0) 'f)
      ((1) 'd)
      ((2) 'c)
      ((3) 'b)
      ((4) 'a))))
      
(define but-last
  (lambda (lst)
    (cond
      ((null? lst) 'empty)
      ((null? (cdr lst)) '())
      (else
       (cons (car lst) (but-last (cdr lst)))))))

(define butt-last
  (lambda (lst)
    (cond
      ((null? lst) 'empty)
      ((null? (cdr lst)) '())
      (else
       (cons (car lst) (butt-last (cdr lst)))))))

(define add
  (lambda (lst)
    (cond
      ((null? lst) 0)
      (else
       (+ (car lst) (add (cdr lst)))))))

(define ad
  (lambda (lst)
    (cond
      ((null? lst) 1)
      (else
       (+ (car lst) (ad (cdr lst)))))))

(define last
  (lambda (lst)
    (cond
      ((null? lst) 'empty)
      ((null? (cdr lst)) (car lst))
      (else
       (last (cdr lst))))))

(define sum1n
  (lambda (n)
    (cond
      ((= n 1) 1)
      (else
       (+ n (sum1n (- n 1)))))))

(define find-number
    (lambda (nbr lst)
      (cond
        ((null? lst) (display "The number is not there."))
        ((eq? nbr (car lst)) (car lst))
        (else
         (find-number nbr (cdr lst))))))

(define remove-number
  (lambda (nbr lst)
    (cond
      ((null? lst) (display "The list is empty."))
      ((eq? nbr (car lst)) (cdr lst))
      (else
       (cons (car lst) (remove-number nbr (cdr lst)))))))
    
(define counter 0)
(define count!
  (lambda ()
    (set! counter (+ 1 counter)) counter))

;Returns a list without the number that was entered, and if there are more than one of the same number, only takes away one.
(define test-procedure
  (lambda (lst n)
    (cond
      ((null? lst) '())
      ((= (car lst) n) (cdr lst))
      (else
       (cons (car lst) (test-procedure (cdr lst) n))))))

(define lst (list 1 2 3 4 5 6 7 8 9 0))
(define evenlst (list 2 4 6 8))
(define oddlst (list 1 3 5 7 9))
(define samelst (list 1 2 3 4 3 5 6 3 7 8 3 9 3 0))
(define emptylst ())




(define display-more
  (lambda args
    (for-each display args)))

(define display-english-list
  (lambda (lst)
    (letrec ((recursion ; what in the world is a letrec?
              (lambda (lst)
                (cond 
                  ((null? lst)) ; do nothing
                  ((null? (cdr lst)) (display-more " and " (car lst)))
                  (else 
                   (display-more ", " (car lst))
                   (recursion (cdr lst)))))))
      (cond
        ((null? lst) (display "nothing"))
        ((= 2 (length lst)) (display-more (car lst) " and " (cadr lst)))
        (else 
         (display (car lst))
         (recursion (cdr lst))
         (newline))))))


(define plus
    (lambda x
      (for-each display x)))

(plus lst evenlst oddlst)
(newline)
(newline)
(display-english-list lst)
(newline)
(newline)
(display-english-list '(hernan))

(reverse 
 (list-tail
  (reverse (list-tail '(w x y z) 1)) 1))

(map - '(10 20 30))

(define lst '(a b c d e f g))

(map list 
     '(x y z)
     '(a b c))

(define start
  (lambda (x)
    (x 2 3)))

(start (lambda (x y)
         (display "This is the result:")
         (display x)
         (display y)))

(define lst2 '(1 2 3 4 5))

(map (lambda (x) 
       (list-ref x 1)) 
     '((b b c) (a b c) (c n n) (f o x) (q v c)))