(:*******************************************************:)
(: Test: K-SeqAVGFunc-27                                 :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:23+01:00                       :)
(: Purpose: A test whose essence is: `avg((1, 2, xs:untypedAtomic("3"))) instance of xs:double`. :)
(:*******************************************************:)
avg((1, 2, xs:untypedAtomic("3"))) instance of xs:double