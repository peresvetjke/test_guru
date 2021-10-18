class Rule < ApplicationRecord
  belongs_to :category, optional: true
  has_many :badges

  validates :title, presence: true
  validate :maintained?

  def maintained?
    if [self.category_id, self.first_try, self.all_tests, self.level].all? { |attr| attr.nil? }
      errors.add :base, "Правило не заполнено."
    end
  end
end