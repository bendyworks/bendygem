module Bendy

  # Some logical methods
  module Logical

    # @!method implies(antecedent){ consequent } #=> true or consequent
    #
    # Material implication
    #
    # +implies+ is the common case where if the first thing is true
    # (antecedent), then pay attention to the second thing (consequent). But
    # if the first thing is false then the whole thing is true:
    #
    # @example Extract the bar value given foo exists
    #     implies(foo){foo[:bar]}
    def implies(antecedent)
      !!antecedent ? yield : true
    end
  end
end
