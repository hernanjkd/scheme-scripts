(define time
  (lambda (inhr inmin outhr outmin)
    (newline)
    
    (let ((min
           (lambda (min)             
             (/ (* min 100) 6000))))      
      (let ((display-more
             (lambda args
               (for-each display args))))
        
        (cond
          ((= inmin 0) (display-more "IN " inhr ":" inmin "0"))
          (else
           (display-more "IN " inhr ":" inmin)))
        
        (newline)
        
        (cond
          ((= outmin 0) (display-more "OUT " outhr ":" outmin "0"))
          (else
           (display-more "OUT " outhr ":" outmin)))
        
        (newline)
        (newline)
        
        (cond 
          ((> inmin outmin) (and (set! outhr (- outhr 1)) (set! outmin (+ 60 outmin))                                 
                                 (cond
                                   ((>= inhr outhr) (and (set! outhr (+ 12 outhr))
                                                        (display-more "HOURS " (- outhr inhr) "." (- (min outmin) (min inmin)))))
                                   (else
                                    (display-more "HOURS " (- outhr inhr) "." (- (min outmin) (min inmin)))))))          
          (else
           (cond
             ((>= inhr outhr) (and (set! outhr (+ 12 outhr))
                                  (display-more "HOURS " (- outhr inhr) "." (- (min outmin) (min inmin)))))
             (else
              (display-more "HOURS " (- outhr inhr) "." (- (min outmin) (min inmin)))))))
                                                 
        (newline)
        (newline)
        
        (display "EARNED $")
        
        (cond
          ((> inhr outhr) (and (set! outhr (+ 12 outhr))
                               (* 7 (- (+ outhr (min outmin)) (+ inhr (min inmin))))))
          (else
           (* 7.75 (- (+ outhr (min outmin)) (+ inhr (min inmin))))))
        ) ;let
      ) ;let 
    ) ;lambda
  ) ;define