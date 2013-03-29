class EmailAddress < Url
  validates_email_format_of :address

  def self.prefix
    'mailto:'
  end
end
