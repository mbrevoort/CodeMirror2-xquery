(:*******************************************************:)
(: Test: K-ContextCurrentTimeFunc-2                      :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:23+01:00                       :)
(: Purpose: Test that the Dynamic Context property 'current dateTime' when presented as a xs:time is stable during execution. :)
(:*******************************************************:)
current-time() eq current-time()