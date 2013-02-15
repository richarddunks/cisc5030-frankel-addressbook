require 'test_helper'

class AddressTypeTest < ActiveSupport::TestCase
  test "Strigified type is same as name" do
    a = AddressType.new(name: "foo")
    assert "#{a.name}" == "#{a}"
  end
end
