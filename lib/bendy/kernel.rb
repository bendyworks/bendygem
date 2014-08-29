##
# Refine the Kernel module

module Bendy

    # @!method require()
    #   +require+ does the normal thing that require does, but also logs it

  refine Kernel do
    def require_with_log(name)
      puts "require: #{name}"
      old_require name
    end

    alias_method :old_require, :require
    alias_method :require, :require_with_log
  end
end
