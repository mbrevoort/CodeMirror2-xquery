(:*******************************************************:)
(:Test: minflt2args-4                                     :)
(:Written By: Carmelo Montanez                            :)
(:Date: Fri Dec 10 10:15:47 GMT-05:00 2004                :)
(:Purpose: Evaluates The "min" function                  :)
(: with the arguments set as follows:                    :)
(:$arg1 = xs:float(lower bound)                          :)
(:$arg2 = xs:float(mid range)                            :)
(:*******************************************************:)

fn:min((xs:float("-3.4028235E38"),xs:float("0")))