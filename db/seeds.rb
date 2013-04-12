# This file should contain all the record creation needed to seed the
# database with its default values.
#
# The data can then be loaded with the rake db:seed (or created
# alongside the db with db:setup).

require 'faker'

AddressType.delete_all
%w[Home Work Other].each do |n|
  AddressType.create!(name: n)
end

def street
  s = Faker::Address.street_address
  return s if rand(2)
  s += "\n" + Faker::Address.secondary_address
end

def random_type
  AddressType.offset(rand(AddressType.count)).first.id
end

Entry.delete_all
100.times do
  entry = Entry.new(
    first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
    title: Faker::Name.title
    )
  # rand(4).times do |i|
  #   entry.phones.build(
  #     address_type_id: random_type,
  #     number: Faker::PhoneNumber.phone_number
  #   )
  #end
  rand(4).times do |i|
    entry.addresses.build(
      address_type_id: random_type,
      street: street,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zip: Faker::Address.zip_code
    )
  end
  rand(4).times do |i|
    entry.email_addresses.build(
      address_type_id: random_type,
      address: Faker::Internet.email,
      )
  end
  rand(4).times do |i|
    entry.web_addresses.build(
      address_type_id: random_type,
      address: Faker::Internet.domain_name,
      )
  end
  entry.save!
end
