class QuestionsController < ApplicationController
  def index
    @questions = Question.where('test_id = ?', params[:test_id])
    render inline: "<ul> <% @questions.each do |q| %> <li>ID:<%= q.id %> / <%= q.body %> <%= button_to 'Destroy', test_question_path(q.test, q), data: {:confirm => 'Are you sure?'}, :method => :delete %> </li> <% end %> </ul>"
  end
end