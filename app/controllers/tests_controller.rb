class TestsController < ApplicationController
  before_action :find_test, only: [:start]
  before_action :set_tests, only: %i[index start]

  def index
    
  end

  def start
    @test_passage = current_user.test_passages.new(test: @test)
    if @test_passage.save
      redirect_to current_user.test_passage(@test)
    else
      flash.now[:notice] = @test_passage.errors.full_messages.join('; ')
      render :index
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.published
  end
end