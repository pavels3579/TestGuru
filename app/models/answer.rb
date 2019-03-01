class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validates :validate_answers_count, on: :create

  private

  def validate_answers_count
    errors.add(:answers) if question.answers.count == 4
  end
end
