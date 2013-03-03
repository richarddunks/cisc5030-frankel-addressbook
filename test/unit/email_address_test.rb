require 'test_helper'

class EmailAddressTest < ActiveSupport::TestCase
  test "should prefix with mailto" do
    w = EmailAddress.new(address: "foo@bar.com")
    assert_equal w.to_url, "mailto:#{w.address}"
  end
  test "should not allow blanks" do
    refute EmailAddress.new.valid?
  end
  test "should not allow bogus address" do
    refute EmailAddress.new(address: "foo").valid?
  end
end
