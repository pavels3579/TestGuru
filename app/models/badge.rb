class Badge < ApplicationRecord
  validates :title, :url, :rule_name, :rule_value, presence: true
end
