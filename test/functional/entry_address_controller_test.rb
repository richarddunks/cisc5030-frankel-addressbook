require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  setup do
    @entry = entries(:valid)
    Address.delete_all # remove fixtures
    @entry.addresses.build(address_type_id: 1, zip: 10000, state: 'NY')
  end

  test "should have all address fields in form" do
    get :new
    Address.accessible_attributes.reject(&:blank?).each do |f|
      assert_select "#entry_addresses_attributes_0_#{f}", true
    end
  end

  test "should create entry with address" do
    assert_difference('Address.count') do
      @entry.save
    end
  end

  test "should show address entry" do
    @entry.save
    get :show, id: @entry
    assert_select "div.address", true
  end

  test "should have all a filled in sub-form, and a blank entry" do
    # make sure form properly filled in
    @entry.save
    get :edit, id: @entry
    %w[zip state].each do |f|
      assert_select "#entry_addresses_attributes_0_#{f}[value=?]",
      @entry.addresses[0].send(f)
    end
    Address.accessible_attributes.reject(&:blank?).each do |f|
      assert_select "#entry_addresses_attributes_1_#{f}", true
    end
  end
end
