(:*******************************************************:)
(: Test: K-YearMonthDurationDivide-5                     :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Simple test of dividing a xs:yearMonthDuration with NaN. :)
(:*******************************************************:)
xs:yearMonthDuration("P3Y36M") div xs:double("NaN")