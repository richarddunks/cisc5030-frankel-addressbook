def test_nested(klass, attributes = {})
  setup do
    @entry = entries(:valid)
    klass.delete_all # remove fixtures
    @entry.send(attrize(klass)).build(attributes).save
  end

  test "should have all #{attrize(klass)} fields in form" do
    get :new
    accessible_attrs(klass).each do |f|
      assert_select attrize(klass, 0, f)
    end
  end

  test "should create entry with #{attrize(klass)}" do
    assert_difference("#{klass}.count", 1) do
      e = Entry.new(first_name: 'foo', last_name: 'bar')
      e.send(attrize(klass)).build(attributes).save
    end
  end

  test "should show #{attrize(klass)} entry" do
    get :show, id: @entry
    assert_select "div.#{attrize(klass).singularize}", true
  end

  test "should have a filled in #{attrize(klass)} and a blank entry" do
    # make sure form properly filled in
    get :edit, id: @entry
    accessible_attrs(klass).each do |f|
      assert_select attrize(klass, 0, f) do |elems|
        elem = elems.first
        value = @entry.send(attrize(klass)).first.send(f)
        if elem.attributes['value'] # only input and text, not select
          assert_equal elem.attributes['value'], value.to_s , "no #{f} with correct value"
        elsif elem.name == 'select'
          assert_select 'option[selected="selected"][value=?]', value, 1,
          "no #{f} select option with correct value"
        end
      end
      assert_select attrize(klass, 1, f), true
    end
  end
  test "should destroy #{attrize(klass)}" do
    assert_difference("#{klass}.count", -1) do
      put :update, id: @entry, entry: {
        "#{attrize(klass, -1)}" => {0 => {
            _destroy: 1, id: @entry.send(attrize(klass)).first.id }}
      }
    end
    assert_redirected_to entry_path(@entry)
  end
end

def attrize(klass, index=nil, field=nil)
    s = klass.name.tableize
    return s unless index

    s << "_attributes"
    return s if index < 0

    "#entry_%s_%s_%s" % [s, index, field]
  end
