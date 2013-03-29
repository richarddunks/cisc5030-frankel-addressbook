require 'test_helper'

class WebAddressTest < ActiveSupport::TestCase
  test "should prefix with http" do
    w = WebAddress.new(address: "example.com")
    assert_equal w.to_url, "http://#{w.address}"
  end
  test "should not allow blanks" do
    refute WebAddress.new.valid?
  end
end
