(:*******************************************************:)
(: Test: K-HexBinaryEQ-3                                 :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Compare two hexBinary values.                :)
(:*******************************************************:)
not(xs:hexBinary("FF") eq xs:hexBinary("aa"))