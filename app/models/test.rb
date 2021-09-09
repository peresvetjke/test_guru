class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many   :assessments
  has_many   :users, through: :assessments

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level, message: 'уже занято для данного уровня' }

  scope :easy,   -> { where('level in (0, 1)')    }
  scope :medium, -> { where('level in (2, 3, 4)') }
  scope :hard,   -> { where('level >= 5')         }
  scope :category_title, -> (category_title) { joins(:category).select('tests.title').distinct.where("categories.title = ?", category_title).order('tests.title DESC') }
end
