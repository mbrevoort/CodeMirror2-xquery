(:*******************************************************:)
(: Test: K2-SeqExprCast-366                              :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Cast xs:unsignedInt to xs:decimal.           :)
(:*******************************************************:)
xs:decimal(xs:unsignedInt(3))