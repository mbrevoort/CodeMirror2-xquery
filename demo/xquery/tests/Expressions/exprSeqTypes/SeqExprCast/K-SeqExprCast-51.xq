(:*******************************************************:)
(: Test: K-SeqExprCast-51                                :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: A test whose essence is: `true() cast as xs:untypedAtomic eq xs:untypedAtomic("true")`. :)
(:*******************************************************:)
true() cast as xs:untypedAtomic 
		eq xs:untypedAtomic("true")