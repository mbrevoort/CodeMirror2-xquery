(:*******************************************************:)
(: Test: K-SeqExprCast-54                                :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: A test whose essence is: `(xs:QName("local-name") cast as xs:untypedAtomic) eq xs:untypedAtomic("local-name")`. :)
(:*******************************************************:)
(xs:QName("local-name") cast as xs:untypedAtomic) 
		eq xs:untypedAtomic("local-name")