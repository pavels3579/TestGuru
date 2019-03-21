class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, only: %i[create update]

  def completed?
    check_time
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.success = true if success?
    save!
  end

  def questions_count
    test.questions.count
  end

  def current_question_number
    test.questions.where('id < ?', current_question.id).count + 1
  end

  def success?
    percent_correct >= 85
  end

  def percent_correct
    correct_questions * 100/questions_count
  end

  def time_left
    has_timer? ? self.created_at + test.timer.minutes - Time.current : nil
  end

  def has_timer?
    !test.timer.nil?
  end


  private

  def before_validation_set_question
    self.current_question = next_question
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def check_time
    self.current_question = nil if has_timer? && time_left < 0
  end

end
