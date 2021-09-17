class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy]

  def index
    @questions = Question.where('test_id = ?', params[:test_id])
    render inline: "<ul> <% @questions.each do |q| %> <li>ID:<%= q.id %> / <%= q.body %> <%= button_to 'Destroy', test_question_path(q.test, q), data: {:confirm => 'Are you sure?'}, :method => :delete %> </li> <% end %> </ul>"
  end

  def new
  end

  def create
    @question = Question.new(question_params)
    @question.test_id = params[:test_id].to_i
    if @question.save
      redirect_to action: :index
    else
      render "new"
    end
  end

  def show
    render inline: "ID: <%= @question.id %> / <%= @question.body %>"
  end

  def edit
  end

  def update
  end

  def destroy
    @question.destroy
    redirect_to "/tests/#{params[:test_id]}/questions"
  end

  private

  def find_question
    @question = Question.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render plain: "Запись c id #{params[:id]} не найдена."
  end

  def question_params
    params.require(:question).permit(:body)
  end
end