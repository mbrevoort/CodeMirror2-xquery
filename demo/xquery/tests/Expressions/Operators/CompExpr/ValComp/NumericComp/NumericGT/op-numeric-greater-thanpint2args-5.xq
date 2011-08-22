(:*******************************************************:)
(:Test: op-numeric-greater-thanpint2args-5                :)
(:Written By: Carmelo Montanez                            :)
(:Date: Thu Dec 16 10:48:16 GMT-05:00 2004                :)
(:Purpose: Evaluates The "op:numeric-greater-than" operator:)
(: with the arguments set as follows:                    :)
(:$arg1 = xs:positiveInteger(lower bound)                :)
(:$arg2 = xs:positiveInteger(upper bound)                :)
(:*******************************************************:)

xs:positiveInteger("1") gt xs:positiveInteger("999999999999999999")