require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  setup do
    @entry = entries(:valid)
    @address = addresses(:valid)
  end

  test "should get index" do
    get :index, entry_id: @entry
    assert_response :success
    assert_not_nil assigns(:addresses)
  end

  test "should get new" do
    get :new, entry_id: @entry
    assert_response :success
  end

  test "should have all fields in form" do
    get :new, entry_id: @entry
    Address.accessible_attributes.reject(&:blank?).each do |f|
      assert_select "#address_#{f}", true
    end
  end

  test "should create address" do
    assert_difference('Address.count') do
      post :create, entry_id: @entry, address: {
        city: @address.city, state: @address.state,
        street: @address.street, zip: @address.zip
      }
    end
    assert_redirected_to entry_address_path(@entry, assigns(:address))
  end

  test "should show address" do
    get :show, id: @address, entry_id: @entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @address, entry_id: @entry
    assert_response :success
  end

  test "should update address" do
    put :update, entry_id: @entry, id: @address, address: {
      city: @address.city, state: @address.state, street: @address.street,
      zip: @address.zip
    }
    assert_redirected_to entry_address_path(@entry, assigns(:address))
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete :destroy, id: @address, entry_id: @entry
    end

    assert_redirected_to entry_addresses_path(@entry);
  end
end
