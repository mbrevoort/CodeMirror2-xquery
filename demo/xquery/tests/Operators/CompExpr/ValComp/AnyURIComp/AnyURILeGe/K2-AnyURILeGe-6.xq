(:*******************************************************:)
(: Test: K2-AnyURILeGe-6                                 :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Invoked 'gt' on xs:anyURI values.            :)
(:*******************************************************:)
not(xs:anyURI("http://example.com/A") gt xs:anyURI("http://example.com/B"))