class Entry < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :addresses_attributes

  has_many :addresses, dependent: :destroy

  accepts_nested_attributes_for :addresses, allow_destroy: true,
  reject_if: :all_blank

  validates_presence_of [:email, :first_name, :last_name]
  validates_email_format_of :email

  def full_name
    "#{first_name} #{last_name}"
  end
end
