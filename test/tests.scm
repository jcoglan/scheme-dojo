(describe null?
  (with "the empty list" '()
    (returns #t ))
  
  (with "a non-empty list" '(k)
    (returns #f ))
)

(describe length
  (with "the empty list" '()
    (returns 0))
  
  (with "a list of one item" '(a)
    (returns 1))
  
  (with "a list of two items" '(1 2)
    (returns 2))
)

(describe append
  (with "two empty lists" '() '()
    (returns '() ))
    
  (with "a non-empty list and an empty list" '(a) '()
    (returns '(a) ))
    
  (with "an empty list and a non-empty list" '() '(b)
    (returns '(b) ))
  
  (with "two non-empty lists" '(a b) '(c d)
    (returns '(a b c d) ))
)

(describe reverse
  (with "the empty list" '()
    (returns '() ))
  
  (with "a single-item list" '(4)
    (returns '(4) ))
  
  (with "a longer list" '(8 2 0 4)
    (returns '(4 0 2 8) ))
)

