(:*******************************************************:)
(: Test: K-SeqExprCast-995                               :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: 'castable as' involving xs:gYearMonth as source type and xs:hexBinary as target type should always evaluate to false. :)
(:*******************************************************:)
not(xs:gYearMonth("1999-11") castable as xs:hexBinary)