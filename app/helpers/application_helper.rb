module ApplicationHelper
  def answer_classes(current_user_answers, question)
    classes = %w[question-card d-flex justify-content-between w-100 button-answer align-items-center text-white]

    if current_user_answers.map(&:question_id).include?(question.id)
      classes << 'with-answer'
    end

    classes.join(' ')
  end
end
