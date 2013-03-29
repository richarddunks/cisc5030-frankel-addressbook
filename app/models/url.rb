class Url < ActiveRecord::Base
  belongs_to :entry
  belongs_to :address_type

  attr_accessible :address, :address_type_id

  validates_presence_of :address

  def to_url
    "#{self.prefix}#{read_attribute(:address)}"
  end

  def prefix
    self.class.prefix
  end

  def self.prefix
    # :nocov:
    raise "Virtual method 'prefix' called!"
    # :nocov:
  end
end
