class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[ show edit update destroy result ]

  def show
    render :result if @test_passage.completed?
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path
    else
      redirect_to @test_passage
    end
  end

  def result
  end

  private
    def set_test_passage
      @test_passage = TestPassage.find(params[:id])
    end
end
