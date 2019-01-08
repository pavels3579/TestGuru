class Answer < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  private

  def validate_answers_count
    errors.add(:answers) if question.answers.count == 4
  end
end
