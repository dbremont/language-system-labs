#lang racket

; (call-with-current-continuation
;   (lambda (k)
;     ; k is the continuation
;     ; using k is like teleporting to where call/cc was called
;     (k some-value)))

; (define counter 0)  ; Global counter

; (define (example)
;   (call-with-current-continuation
;    (lambda (k)
;      (displayln "Captured Continuation!")
;      (set! counter (+ counter 1))  ; Increment counter
;      (k (string-append "Returning from continuation #" (number->string counter) "!"))
;      (displayln "This will never be reached!"))
;   )
; )

; (displayln (example))  ; First call

; (f (lambda (x) x))

; (displayln  (call-with-current-continuation f)) ; Returns 2a)
(/ 2 1 (call-with-current-continuation 
         (lambda (k) 
           (k 3))))  ; Returning 3 to be added

; where + 1 1 is the current comuptation;
; and (call-with-current-continuation 
;          (lambda (k) 
;            (k 3))) is the continuation

; + 1 1 is the environment.

; (* 2 2 2)
