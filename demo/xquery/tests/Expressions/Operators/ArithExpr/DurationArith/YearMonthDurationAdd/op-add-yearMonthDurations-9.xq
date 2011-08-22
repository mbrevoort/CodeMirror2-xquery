(:*******************************************************:)
(:Test: op-add-yearMonthDurations-9                      :)
(:Written By: Carmelo Montanez                           :)
(:Date: June 29, 2005                                    :)
(:Purpose: Evaluates The "add-yearMonthDurations" function used :)
(:together with and "and" expression.                    :)
(: Apply "fn:string" function to account for new EBV.     :)
(:*******************************************************:)
 
fn:string((xs:yearMonthDuration("P01Y01M") + xs:yearMonthDuration("P02Y02M"))) and fn:string((xs:yearMonthDuration("P02Y03M") + xs:yearMonthDuration("P04Y04M")))