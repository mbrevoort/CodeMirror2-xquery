(:*******************************************************:)
(: Test: K2-SeqExprCast-277                              :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Cast xs:double(NaN) to xs:long.              :)
(:*******************************************************:)
xs:long(xs:double("NaN"))