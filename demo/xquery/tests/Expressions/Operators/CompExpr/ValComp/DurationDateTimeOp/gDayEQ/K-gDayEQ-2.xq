(:*******************************************************:)
(: Test: K-gDayEQ-2                                      :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Simple test of 'eq' for xs:gDay.             :)
(:*******************************************************:)
not(xs:gDay("---31") eq xs:gDay("---01"))