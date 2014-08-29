# Bendy module that _freedom patches_ Object and NilClass to add `try`, like
# in ActiveSupport
module Bendy

    # !@method try(:some_method)
    #   +try+ acts like a normal method call, unless it is being called
    #   on a +nil+ object, in which case it returns +nil+:
    #
    #       nil.try(:to_i)   # => nil
    #       "10".try(:to_i)  # => 10
    #
    #   Copied pretty much verbatim from ActiveSupport:
    #   https://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/object/try.rb
  refine Object do
    def try(*a, &b)
      if a.empty? && block_given?
        yield self
      else
        public_send(*a, &b) if respond_to?(a.first)
      end
    end
  end

    # !@method try(:some_method)
    #   +try+ acts like a normal method call, unless it is being called
    #   on a +nil+ object, in which case it returns +nil+:
    #
    #       nil.try(:to_i)   # => nil
    #       "10".try(:to_i)  # => 10
    #
    #   Copied pretty much verbatim from ActiveSupport:
    #   https://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/object/try.rb
  refine NilClass do
    def try(*args)
      nil
    end
  end
end
