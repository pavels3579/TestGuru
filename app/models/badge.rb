class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :url, :rule_name, presence: true
  validates :rule_name, uniqueness: true

  enum rule_names: %i[category level success_first_try]
end
