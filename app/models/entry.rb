class Entry < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name

  validates_presence_of [:email, :first_name, :last_name]
end
