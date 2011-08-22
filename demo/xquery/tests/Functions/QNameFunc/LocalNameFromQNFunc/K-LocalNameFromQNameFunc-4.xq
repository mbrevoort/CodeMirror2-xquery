(:*******************************************************:)
(: Test: K-LocalNameFromQNameFunc-4                      :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:22+01:00                       :)
(: Purpose: A test whose essence is: `local-name-from-QName( QName("example.com/", "pre:lname")) eq "lname"`. :)
(:*******************************************************:)
local-name-from-QName(
			QName("example.com/", "pre:lname")) eq "lname"