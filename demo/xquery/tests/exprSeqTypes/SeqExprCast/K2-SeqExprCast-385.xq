(:*******************************************************:)
(: Test: K2-SeqExprCast-385                              :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Cast xs:nonNegativeInteger to xs:untypedAtomic. :)
(:*******************************************************:)
xs:untypedAtomic(xs:nonNegativeInteger(3))