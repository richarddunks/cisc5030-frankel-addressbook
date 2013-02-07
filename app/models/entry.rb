class Entry < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name

  has_many :addresses

  validates_presence_of [:email, :first_name, :last_name]
  validates_email_format_of :email
end
