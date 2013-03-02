require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  setup do
    @entry = entries(:valid)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should have all fields in form" do
    get :new
    Entry.attribute_names.reject {|n| excluded_attrs.include? n}.each do |f|
      assert_select "input#entry_#{f}", true
    end
  end

  test "should create entry" do
    assert_difference('Entry.count') do
      post :create, entry: {
        email: @entry.email, first_name: @entry.first_name,
        last_name: @entry.last_name
      }
    end
    assert_redirected_to entry_path(assigns(:entry))
  end

  test "should show entry" do
    get :show, id: @entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entry
    assert_response :success
  end
  test "should have all input filled in edit form" do
  # make sure form properly filled in
    get :edit, id: @entry
    Entry.attribute_names.reject {|n| excluded_attrs.include? n}.each do |f|
      assert_select "input#entry_#{f}[value=?]", @entry.send(f)
    end
  end

  test "should update entry" do
    put :update, id: @entry, entry: {
      email: @entry.email, first_name: @entry.first_name,
      last_name: @entry.last_name
    }
    assert_redirected_to entry_path(assigns(:entry))
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete :destroy, id: @entry
    end
    assert_redirected_to entries_path
  end
end
