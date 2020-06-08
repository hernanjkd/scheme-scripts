((lambda (x) 
   (+ x x)) 3)

(let ((scheme
       (lambda (f x y)
         (f x y))))
  (list (scheme + 2 3)
        (scheme - 3 2)
        (scheme cons 'a 'b)
        (scheme append '(1 2) '(3 4))))

(let ((f (let ((x 'sam))
           (lambda (y z)
             (list x y z)))))
  (f 'i 'am))

(let ((f 
       (lambda x x)))
  (f 3 4 5 6 7 8))




(letrec ((even?
          (lambda (x)
            (or (= x 0)
                (odd? (- x 1)))))
         (odd?
          (lambda (x)
            (and (not (= x 0))
                 (even? (- x 1))))))
  (list (even? 20) (odd? 20)))


;Two way to do factorial.
;(define factorial
;  (lambda (n)
;    (let fact ((i n))
;      (if (= i 0)
;          1
;          (* i (fact (- i 1)))))))

;(define factorial
;  (lambda (n)
;    (let fact ((i n) (a 1))
;      (if (= i 0)
;          a
;          (fact (- i 1) (* a i))))))

;Two ways to do fibonacci
;(define fibonacci
;  (lambda (n)
;    (let fib ((i n))
;      (cond
;        ((= i 0) 0)
;        ((= i 1) 1)
;        (else
;         (+ (fib (- i 1)) (fib (- i 2))))))))

;(define fibonacci
;  (lambda (n)
;    (if (= n 0)
;        0
;        (let fib ((i n) (a 1) (a 2))
;          (if (= i 1)
;                     a1
;                      (+ (fib (- i 1)) (+ a1 a2) a1))))))