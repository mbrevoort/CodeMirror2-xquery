(:*******************************************************:)
(: Test: K2-SeqDeepEqualFunc-30                          :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Test deep-equalness of two attribute nodes that has the same name, but different string values. :)
(:*******************************************************:)
deep-equal(attribute name {"content"}, attribute name {})