module Bendy

  ##
  # Some logical methods

  module Logical

    ##
    # Material implication
    # `implies` is the common case where if the first thing is true, then pay
    # attention to the second thing. But if the first thing is false then the
    # whole thing is true: `implies(foo){foo[:bar]}`

    def implies(p)
      !!p ? yield : true
    end
  end
end
