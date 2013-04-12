class Entry < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :title

  [:addresses, :web_addresses, :email_addresses].each do |children|
    has_many children, dependent: :destroy

    attr_accessible "#{children}_attributes".intern
    accepts_nested_attributes_for children, allow_destroy: true,
    reject_if: :all_blank
  end

  validates_presence_of [:first_name, :last_name]

  def full_name
    "#{first_name} #{last_name}"
  end
end
