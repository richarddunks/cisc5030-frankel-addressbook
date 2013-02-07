class Address < ActiveRecord::Base
  belongs_to :entry
  attr_accessible :city, :state, :street, :zip
end
