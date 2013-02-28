# This file should contain all the record creation needed to seed the
# database with its default values.
#
# The data can then be loaded with the rake db:seed (or created
# alongside the db with db:setup).

AddressType.delete_all
%w[Home Work Other].each do |n|
  AddressType.create!({name: n})
end
