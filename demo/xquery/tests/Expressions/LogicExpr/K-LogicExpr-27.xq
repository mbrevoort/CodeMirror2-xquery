(:*******************************************************:)
(: Test: K-LogicExpr-27                                  :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: or expression combined with fn:boolean().    :)
(:*******************************************************:)
true() or boolean((1, 2, 3, current-time())[1] treat as xs:integer)