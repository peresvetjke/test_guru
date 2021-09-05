class Test < ApplicationRecord
  belongs_to :category
  has_many :assessments
  has_many :users, through: :assessments

  def self.same_category_tests(category_title)
    Category.joins(:tests).select('tests.title').distinct.where("categories.title = ?", category_title).order('tests.title DESC').pluck('tests.title')
  end
end
