(:*******************************************************:)
(: Test: K-SeqExprCast-1156                              :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: 'castable as' involving xs:gDay as sourceType and xs:NOTATION should fail due to it involving xs:NOTATION. :)
(:*******************************************************:)
not(xs:gDay("---03") castable as xs:NOTATION)