##
# We're using refinements to _freedom patch_ Array in a safe way.

module Bendy

    # @!method tails()
    #   +tails+ produces all sub-arrays by successively dropping leading
    #   elements:
    #
    #       [1, 2, 3].tails
    #       # => [[1, 2, 3], [2, 3], [3], []]

  refine Array do
    def tails
      (self.length + 1).times.map{ |i| self.drop(i) }
    end
  end

    # @!method inits()
    #   +inits+ produces all sub-arrays by successively taking leading
    #   elements:
    #
    #       [1, 2, 3].inits
    #       # => [[], [1], [1, 2], [1, 2, 3]]

  refine Array do
    def inits
      (self.length + 1).times.map{ |i| self.take(i) }
    end
  end
end
