class Rule < ApplicationRecord
  belongs_to :category, optional: true
  has_many :badges

  validates :title, presence: true
  validate :maintained?, :consistent?

  def condition_met?(passed_test_passage)
    if self.first_try == true
      passed_test_passage.passed_on_first_try?              

    elsif self.all_tests == true 
      if self.category == passed_test_passage.test.category
        all = Test.where(category_id: self.category.id).pluck(:id).sort
        passed = passed_test_passage.tests_passed_ids_same_category          
      elsif self.level == passed_test_passage.test.level
        all = Test.where(level: self.level).pluck(:id).sort
        passed = passed_test_passage.tests_passed_ids_same_level
      end
      !all.nil? && all == passed
    end      
  end

  private

  def maintained?
    errors.add :base, "Правило не заполнено." unless !!self.category_id || !!self.first_try || !!self.all_tests || !!self.level
  end
  
  def consistent?
    errors.add :base, "Пожалуйста, выберите один из двух вариантов: все тесты либо с первой попытки." if self.first_try == true && self.all_tests == true
    errors.add :base, "Пожалуйста, выберите один из двух вариантов: уровень либо категория" if !self.category_id.nil? && !self.level.nil?
  end
end