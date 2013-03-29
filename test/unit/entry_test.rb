require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  test "01 invalid without a first name and last name" do
    refute entries(:empty).valid?
  end
  test "02 invalid w/o a first name" do
    refute entries(:no_first).valid?
  end
  test "03 invalid w/o a last name" do
    refute entries(:no_last).valid?
  end
  test "04 valid with a first name and last name" do
    assert entries(:valid).valid?
  end

  test "05 full name method returns name with first and last" do
    entry = entries(:valid)
    name = entries(:valid).full_name
    assert_match /\b#{entry.first_name}\b/, name, "Includes first name"
    assert_match /\b#{entry.last_name}\b/,  name, "Includes last name"
  end
end
