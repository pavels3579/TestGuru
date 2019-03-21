class Test < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to :author, class_name: "User", foreign_key: :author_id, optional: true

  scope :easy, -> { select_by_level(0..1) }
  scope :medium, -> { select_by_level(2..4) }
  scope :hard, -> { select_by_level(5..Float::INFINITY) }

  scope :select_by_level, ->(level) { where(level: level) }

  scope :select_by_category, -> (category_title) {
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level }
  validates :timer, numericality: { allow_nil: true, only_integer: true, greater_than: 0 }

  def self.select_by_category_title(category_title)
    Test.select_by_category(category_title).pluck(:title)
  end
end
