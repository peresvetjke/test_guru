class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many :assessments
  has_many :users, through: :assessments


  def self.list_by_category_title(category_title)
    Test.joins(:category).select('tests.title').distinct.where("categories.title = ?", category_title).order('tests.title DESC').pluck('tests.title')
  end
end
