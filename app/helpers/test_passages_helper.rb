module TestPassagesHelper

  def current_question_order_number(test_passage)
    return '-' if test_passage.completed?
    test_passage.test.questions.pluck(:id).sort.index(test_passage.current_question.id) + 1
  end

  def previous_question_order_number(test_passage)
    return current_question_order_number(test_passage) if current_question_order_number(test_passage) == 1
    return test_passage.test.questions.count if test_passage.completed?
    
    current_question_order_number(test_passage) - 1 
  end

  def progress(test_passage, previous = false)
    question_order_number = previous ? previous_question_order_number(test_passage) : current_question_order_number(test_passage)

    if test_passage.completed? && previous == false
      100
    else
      (((question_order_number - 1) / test_passage.test.questions.count.to_f) * 100).ceil
    end
  end
end
