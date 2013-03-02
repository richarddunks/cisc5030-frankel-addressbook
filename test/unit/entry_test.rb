require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  test "01 invalid without a first name, last name and email" do
    refute entries(:empty).valid?
  end
  test "02 invalid w/o a first name" do
    refute entries(:no_first).valid?
  end
  test "03 invalid w/o a last name" do
    refute entries(:no_last).valid?
  end
  test "04 invalid w/o an email" do
    refute entries(:no_email).valid?
  end

  test "06 valid with a first name, last name and email" do
    assert entries(:valid).valid?
  end

  test "07 full name method returns name with first and last" do
    entry = entries(:valid)
    name = entries(:valid).full_name
    assert_match /\b#{entry.first_name}\b/, name, "Includes first name"
    assert_match /\b#{entry.last_name}\b/,  name, "Includes last name"
  end

  test "05 invalid with a bogus email" do
    refute entries(:bad_email).valid?
  end
end
