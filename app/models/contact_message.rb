class ContactMessage
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :subject, :content, :email # :name
  
  validates_presence_of :subject, :content, :email
  validates_format_of :email, with: /@/
  validates_length_of :content, :maximum => 500
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end

end