(:*******************************************************:)
(: Test: K-DurationEQ-29                                 :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Test comparing xs:duration and xs:yearMonthDuration stressing value representations are normalized properly. :)
(:*******************************************************:)
xs:yearMonthDuration("P1M") ne xs:duration("P31D")