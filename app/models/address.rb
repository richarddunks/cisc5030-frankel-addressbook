class Address < ActiveRecord::Base
  belongs_to :entry
  belongs_to :address_type

  attr_accessible :city, :state, :street, :zip, :address_type_id

  validates_presence_of :state, :zip, :address_type_id

  alias :type :address_type
end
