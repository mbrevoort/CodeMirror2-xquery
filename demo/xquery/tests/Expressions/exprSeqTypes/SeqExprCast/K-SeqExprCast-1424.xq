(:*******************************************************:)
(: Test: K-SeqExprCast-1424                              :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: 'castable as' involving xs:QName as source type and xs:untypedAtomic as target type should always evaluate to true. :)
(:*******************************************************:)
xs:QName("ncname") castable as xs:untypedAtomic