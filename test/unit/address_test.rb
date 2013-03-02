require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  test "invalid without state" do
    refute addresses(:no_state).valid?
  end
  test "valid with all fields" do
    assert addresses(:valid).valid?, -> {
      addresses(:valid).errors.collect { |k,v| "\n#{k}: #{v}" }.join("")
    }
  end
end
