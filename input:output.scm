;Procedure to use in call-with-input-file. Recurses to read each word and cons
;them together.
(define proc
  (lambda (p)
    (let f ((x (read p)))
      (if (eof-object? x)
          '()
          (cons x (f (read p)))))))

;(call-with-input-file "state.txt" proc)

;This procedure does the same as call-with-input-file
(define reader
  (lambda (filename)
    (define file (open-input-file filename))
    (letrec ((loop
              (lambda (remaining)
                (define word (read file))
                (cond 
                  ((eof-object? word) '())
                  (else
                   (cons word (loop file)))))))
      (define show (loop filename))
      (close-input-port file)
      show)))


;Procedure to use in call-with-output-file. Writes the objects in a list 
;separating them with a newline.
(define list-to-print '(Computer Science Physics Universe Quantum))
(define proc
  (lambda (p)
    (let f ((lst list-to-be-printed))
      (if (not (null? lst))
          (begin
            (write (car lst) p)
            (newline p)
            (f (cdr lst)))))))

;Does the same as call-with-output-file, but instead of using newline it uses
;a space.
(define write-list
  (lambda (filename list)
    (define file (open-output-file filename))
    (let loop ((lst list))
      (cond
        ((null? lst) (close-output-port file))
        (else
         (begin
           (write (car lst) file)
           (write '_ file)
           (loop (cdr lst))))))))