class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[ show edit update destroy result create_gist ]

  def show
    redirect_to result_test_passage_path(@test_passage) if @test_passage.completed?
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.evaluate_result!
      BadgeAwarder.new(@test_passage).call
      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to @test_passage
    end
  end

  def result
    @badges = @test_passage.badges
  end

  def create_gist
    gist_creator = GistCreator.new(@test_passage.current_question)
    response = gist_creator.call

    if gist_creator.success? && current_user.gists.create(question_id: @test_passage.current_question.id, github_gist_id: response.id) 
      flash[:notice] = "#{ t('gists.successfully_created') } (#{view_context.link_to response.id, response.html_url})"
    else
      flash[:notice] = t('gists.error_occured')
    end

    redirect_to test_passage_path(@test_passage)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
