module QuestionsHelper
  def question_header
    if ['new', 'create'].include? (params[:action])
      "Создание нового вопроса для теста '#{@question.test.title}'"
    elsif ['edit', 'update'].include? (params[:action])
      "Изменение вопроса для теста '#{@question.test.title}'"
    end
  end
end