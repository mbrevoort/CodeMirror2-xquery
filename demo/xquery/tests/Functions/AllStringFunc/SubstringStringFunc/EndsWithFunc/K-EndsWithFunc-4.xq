(:*******************************************************:)
(: Test: K-EndsWithFunc-4                                :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: A test whose essence is: `ends-with("a string", "a string", "http://www.example.com/COLLATION/NOT/SUPPORTED")`. :)
(:*******************************************************:)
ends-with("a string", "a string",
			"http://www.example.com/COLLATION/NOT/SUPPORTED")