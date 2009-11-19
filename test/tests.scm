(describe factorial
  (with "zero"  (: 0) => 1 )
  (with "one"   (: 1) => 1 )
  (with "two"   (: 2) => 2 )
  (with "three" (: 3) => 6 ))



(describe null?
  (with "the empty list"    (: '())   => #t )
  
  (with "a non-empty list"  (: '(k))  => #f )
)



(describe length
  (with "the empty list"      (: '())     => 0 )
  
  (with "a list of one item"  (: '(a))    => 1 )
  
  (with "a list of two items" (: '(1 2))  => 2 )
)



(describe append
  (with "two empty lists"                     (: '() '())       => '() )
  
  (with "an empty list and a non-empty list"  (: '() '(b))      => '(b) )
    
  (with "a non-empty list and an empty list"  (: '(a) '())      => '(a) )
  
  (with "two non-empty lists"                 (: '(a b) '(c d)) => '(a b c d) )
)



(describe reverse
  (with "the empty list"      (: '())         => '() )
  
  (with "a single-item list"  (: '(4))        => '(4) )
  
  (with "a longer list"       (: '(8 2 0 4))  => '(4 0 2 8) )
)



(describe map
  (with "the empty list"  (: factorial '())       => '() )
  
  (with "a singular list" (: factorial '(5))      => '(120) )
  
  (with "a longer list"   (: factorial '(3 6 8))  => '(6 720 40320) )
)



(describe list=?
  (with "two empty lists"               (: '() '())           => #t )
  
  (with "two equal short lists"         (: '(a) '(a))         => #t )
  
  (with "two equal long lists"          (: '(a b c) '(a b c)) => #t )
  
  (with "two unequal long lists"        (: '(a c b) '(a b c)) => #f )
  
  (with "a long list and a short list"  (: '(a b c) '(a))     => #f )
  
  (with "a short list and a long list"  (: '(a) '(a b c))     => #f )
  
  ; Bonus points!
  (with "compound lists" (: '((1 2) 3) '((1 2) 3)) => #t )
)

