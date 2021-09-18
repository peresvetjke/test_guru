class QuestionsController < ApplicationController
  before_action :find_test,     only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    @questions = @test.questions
    render inline: "<ul> <% @questions.each do |q| %> <li>ID:<%= q.id %> / <%= q.body %> <%= button_to 'Destroy', question_path(q), data: {:confirm => 'Are you sure?'}, :method => :delete %> </li> <% end %> </ul>"
  end

  def new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
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
    redirect_to @question.test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_record_not_found
    render plain: "Запись c id #{params[:id]} не найдена."
  end
end