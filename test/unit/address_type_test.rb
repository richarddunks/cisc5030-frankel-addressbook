require 'test_helper'

class AddressTypeTest < ActiveSupport::TestCase
  test "Stringified type is same as name" do
    a = AddressType.new(name: "foo")
    assert "#{a.name}" == "#{a}"
  end
  test "First AddressType in db is 'Home'" do
    AddressType.first.name == 'Home'
  end
end
