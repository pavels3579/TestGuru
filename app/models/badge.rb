class Badge < ApplicationRecord
  validates :title, :url, :rule_name, presence: true
end
