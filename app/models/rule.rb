class Rule < ApplicationRecord
  belongs_to :category, optional: true
  has_many :badges

  validates :title, presence: true
  validate :maintained?

  def condition_met?(passed_test_passage)
    if self.first_try == true
      passed_test_passage.passed_on_first_try?              
    else 
      all = tests
      passed = all.passed(passed_test_passage.user)
      !all.empty? && all.pluck(:id).sort == passed.pluck(:id).sort
    end      
  end

  def tests
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