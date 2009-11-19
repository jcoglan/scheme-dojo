(define-syntax describe (syntax-rules (with : =>)
  [(_ function-name) '()]
  [(_ function-name
      (with argument-description (: argument ...) => result)
      further-clauses ...)
   (begin
     (make-test 'function-name
                argument-description
                `(,argument ...)
                result)
     (describe function-name further-clauses ...))]))

(define unit-tests '())

(define (make-test function-name argument-description arguments expected)
  (define (do-test index)
    (print "----------------------------------------------------------------")
    (print index "|" function-name argument-description)
    (display (cons function-name arguments))
    (display " => ")
    (let* ([function (eval function-name)]
           [actual (apply function arguments)])
      (print actual)
      (cond [(equal? actual expected)
              (print "PASSED\n")]
            [else
              (print "expected" expected ", got" actual "\n")
              (error "FAIL")])))
  (set! unit-tests (cons do-test unit-tests)))

(define (run-tests!)
  (define (run-list list)
    (if (equal? '() list)
        '()
        (begin
          (run-list (cdr list))
          ((car list) (list-length list)))))
  (run-list unit-tests))

(define (print . args)
  (if (equal? '() args)
      (display "\n")
      (begin
        (display (car args))
        (display " ")
        (apply print (cdr args)))))

(define (list-length list)
  (if (equal? '() list)
      0
      (+ (list-length (cdr list))
         1)))

