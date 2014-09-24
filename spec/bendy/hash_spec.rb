require 'minitest/spec'
require 'minitest/autorun'
require 'bendy/hash'

using Bendy

describe Hash do
  before do
    @hash = { foo: { bar: { baz: 1 } } }
  end

  describe '#get_deep' do
    it 'accesses a key inside a nested hash' do
      @hash.get_deep(:foo, :bar, :baz).must_equal 1
    end

    it 'accesses a key inside a nested hash' do
      @hash.get_deep(:foo, :bar, :baz, :quux).must_equal nil
    end
  end
end
