(:*******************************************************:)
(: Test: K-TimeSubtract-8                                :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: The 'mod' operator is not available between xs:time and xs:time. :)
(:*******************************************************:)
xs:time("08:01:23") mod xs:time("08:01:23")