(:*******************************************************:)
(: Test: K-DateLT-3                                      :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Simple test of 'lt' for xs:date.             :)
(:*******************************************************:)
not(xs:date("2004-07-13") lt
			       xs:date("2004-07-13"))