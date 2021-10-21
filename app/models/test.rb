class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many   :test_passages, dependent: :destroy
  has_many   :users, through: :test_passages
  has_many   :questions, dependent: :destroy

  validates :title,         presence: true
  validates :level,         numericality: { only_integer: true, greater_than: 0 }
  validates :title,         uniqueness:   { scope: :level, message: 'уже занято для данного уровня' }

  scope :easy,                    -> { where('level in (0, 1)')    }
  scope :medium,                  -> { where('level in (2, 3, 4)') }
  scope :hard,                    -> { where('level >= 5')         }
  scope :published,               -> { where('published = true')   }
  scope :tests_by_category_title, -> (category_title) { joins(:category).where("categories.title = ?", category_title) }
  scope :tests_passed_by_user,    -> (user)           { joins(:users).where("users.id = :user_id AND test_passages.passed = true", user_id: user.id)}

  MIN_QUESTIONS_AMOUNT = 1

  def self.titles_by_category_title(category_title)
    Test.category_title(category_title).distinct.order('tests.title DESC').pluck('tests.title')
  end

  def finalized?
    self.has_min_questions_amount? && !self.has_questions_without_answers? && !self.has_questions_without_correct_answers?
  end

  private

  def has_min_questions_amount?
    self.questions.count >= MIN_QUESTIONS_AMOUNT
  end

  def has_questions_without_answers?
    self.questions.any? { |q| q.answers.count < 1 }
  end

  def has_questions_without_correct_answers?
    self.questions.any? { |q| q.answers.correct.count < 1 }
  end
end
