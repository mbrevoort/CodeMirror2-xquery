(:*******************************************************:)
(: Test: K2-NumericMod-44                                :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Left op is xs:float/0 with INF as divisor.   :)
(:*******************************************************:)
xs:float("0") mod xs:float("INF")