(:*******************************************************:)
(: Test: K2-OrderbyExprWithout-40                        :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Overshadowing variable that leads to type error. :)
(:*******************************************************:)
for $a in (3, 2, 1)
let $a := (2, 1),
$b := (2, 1),
$c := (2, 1),
$d:= (2, 1)
order by $a
return $a