(:*******************************************************:)
(: Test: K-ContextPositionFunc-36                        :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:23+01:00                       :)
(: Purpose: position() combined with a comparison operator inside a predicate. :)
(:*******************************************************:)
deep-equal((4, 5), (1, 2, current-time(), 4, 5)[3 lt position()])