##
# We're using refinements to _freedom patch_ Hash in a safe way.

module Bendy

    # @!method get_deep()
    #   +get_deep+ digs into a hash along the "route" given by fields
    #   elements:
    #
    #       { foo: { bar: { baz: 1 } } }.get_deep(:foo, :bar, :baz)
    #       # => 1
    #
    #       { foo: { bar: { baz: 1 } } }.get_deep(:foo, :bar, :baz, :quux)
    #       # => nil

  refine Hash do
    def get_deep(*fields)
      fields.inject(self) {|acc,e| acc[e] if acc.is_a?(Hash)}
    end
  end
end
