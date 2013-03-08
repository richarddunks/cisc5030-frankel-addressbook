require 'test_helper'
require 'nested_test_helpers'

class EntriesControllerTest < ActionController::TestCase
   test_nested(Address,
    address_type_id: AddressType.first.id,
    street: "100 Main", city: 'New York', state: 'NY', zip: 10000
    )
 test_nested(EmailAddress,
    address: "foo@bar.com", address_type_id: AddressType.first.id
    )
  test_nested(WebAddress,
    address: "here.example.com", address_type_id: AddressType.last.id
    )
end
