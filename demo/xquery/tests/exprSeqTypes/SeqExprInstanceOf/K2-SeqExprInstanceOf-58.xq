(:*******************************************************:)
(: Test: K2-SeqExprInstanceOf-58                         :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Check that xs:nonNegativeInteger is not a child of nonPositiveInteger. :)
(:*******************************************************:)
xs:nonNegativeInteger("1") instance of xs:nonPositiveInteger