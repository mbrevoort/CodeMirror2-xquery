(:*******************************************************:)
(: Test: K-SeqExprCast-1344                              :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: Casting from xs:hexBinary to xs:gYearMonth isn't allowed. :)
(:*******************************************************:)
xs:hexBinary("0FB7") cast as xs:gYearMonth