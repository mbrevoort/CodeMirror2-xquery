(:*******************************************************:)
(: Test: K2-Axes-73                                      :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Apply function fn:empty() on the descendant axis applied on an element constructor that has an attribute. :)
(:*******************************************************:)
empty(<e attr=""/>/descendant::node())