class Rule < ApplicationRecord
  belongs_to :category, optional: true
  has_many :badges

  validates :title, :method, presence: true
  # validate :maintained?

  def relevant_tests
    query = Test
    query = query.where(category_id: self.category.id) if self.category.present?
    query = query.where(level: self.level) if self.level.present? 
    query
  end

  private

  # для правила хватит имя правила для отображения(если хочешь), имя правила для вызова метода проверки, значение параметра для правила
  # а если будут еще правила какие-то ты будешь новые поля добавлять? и в итоге у тебя будет мусор в таблице, 
  # где почти все строки пустые, а только парочка имеет значение. надо придумать другой подход
  #

  # def maintained?
  #   errors.add :base, "Правило не заполнено." if self.category_id.nil? && self.level.nil? unless self.first_try.present?
  # end
end