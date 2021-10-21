class Rule < ApplicationRecord
  belongs_to :category, optional: true
  has_many :badges

  validates :title, presence: true
  validate :maintained?

  def relevant_tests
    query = Test
    query = query.where(category_id: self.category.id) if self.category.present?
    query = query.where(level: self.level) if self.level.present? 
    query
  end

  private

  def maintained?
    errors.add :base, "Правило не заполнено." if self.category_id.nil? && self.level.nil? unless self.first_try.present?
  end
end