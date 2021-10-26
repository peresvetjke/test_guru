class Rule < ApplicationRecord
  belongs_to :category, optional: true
  has_many :badges

  validates :title, :method, presence: true
  validate  :method_exists?
  validates :value, absence: true, if: -> { self.method == 'first_try' }
  validates :value, presence: true, numericality: { only_integer: true, greater_than: 0 }, if: -> { ["level", "category"].include?(self.method) }
  validate  :category_exists?, if: -> { self.method == "category" }
  
  private

  def method_exists?
    errors.add :method, message: "type doesn't exist" unless BadgeAwarder::METHOD_TYPES.include?(self.method.to_sym)
  end

  def category_exists?
    errors.add :category, message: "doesn't exist" unless Category.where(id: value).pluck(:id).include?(value.to_i)
  end
end