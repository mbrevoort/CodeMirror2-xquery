(:*******************************************************:)
(: Test: K-FilterExpr-87                                 :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:20+01:00                       :)
(: Purpose: A predicate that never can match.            :)
(:*******************************************************:)
empty((1, 2, 3, current-time())[0])