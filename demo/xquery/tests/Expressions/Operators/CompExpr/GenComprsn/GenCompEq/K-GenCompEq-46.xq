(:*******************************************************:)
(: Test: K-GenCompEq-46                                  :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: General comparison causing a xs:untypedAtomic value to be cast to xs:boolean, and then compared. :)
(:*******************************************************:)
(true() = xs:untypedAtomic("true"))