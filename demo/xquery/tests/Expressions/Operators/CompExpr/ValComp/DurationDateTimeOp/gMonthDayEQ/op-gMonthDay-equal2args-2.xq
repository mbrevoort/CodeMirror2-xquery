(:*******************************************************:)
(:Test: op-gMonthDay-equal2args-2                         :)
(:Written By: Carmelo Montanez                            :)
(:Date: Tue Apr 12 16:29:07 GMT-05:00 2005                :)
(:Purpose: Evaluates The "op:gMonthDay-equal" operator   :)
(: with the arguments set as follows:                    :)
(:$arg1 = xs:gMonthDay(mid range)                        :)
(:$arg2 = xs:gMonthDay(lower bound)                      :)
(:*******************************************************:)

xs:gMonthDay("--04-10Z") eq xs:gMonthDay("--01-01Z")