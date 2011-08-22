(:*******************************************************:)
(: Test: K-SeqExprCast-371                               :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Ensure when casting xs:time to xs:string that a milli seconds part of '435' is handled properly. :)
(:*******************************************************:)
xs:string(xs:time("21:01:23.435")) eq "21:01:23.435"