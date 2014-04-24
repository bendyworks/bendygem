##
# We're using refinements to *freedom patch* `Array` in a safe way.

module Bendy


  refine Array do

    ##
    # `tails` produces all sub-arrays by successively dropping leading
    # elements:
    #
    #     [1, 2, 3].tails
    #     # => [[1, 2, 3], [2, 3], [3], []]

    def tails
      (self.length + 1).times.map{ |i| self.drop(i) }
    end

    ##
    # `inits` produces all sub-arrays by successively taking leading
    # elements:
    #
    #     [1, 2, 3].tails
    #     # => [[], [1], [1, 2], [1, 2, 3]]</tt>

    def inits
      (self.length + 1).times.map{ |i| self.take(i) }
    end
  end
end
