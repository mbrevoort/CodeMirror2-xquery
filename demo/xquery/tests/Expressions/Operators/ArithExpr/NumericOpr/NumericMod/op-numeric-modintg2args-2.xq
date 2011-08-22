(:*******************************************************:)
(:Test: op-numeric-modintg2args-2                         :)
(:Written By: Carmelo Montanez                            :)
(:Date: Thu Dec 16 10:48:16 GMT-05:00 2004                :)
(:Purpose: Evaluates The "op:numeric-mod" operator       :)
(: with the arguments set as follows:                    :)
(:$arg1 = xs:integer(lower bound)                        :)
(:$arg2 = xs:integer(upper bound)                        :)
(:*******************************************************:)

xs:integer("-999999999999999999") mod xs:integer("999999999999999999")