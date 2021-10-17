class ContactMessage < ApplicationRecord
  belongs_to :user

  validates :subject, :content, presence: true
  validates :email, presence: true, format: { with: /@/ }

end
