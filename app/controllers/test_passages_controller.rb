class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[ show edit update destroy result create_gist ]

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

  def create_gist
    github_gist = GistCreator.new(@test_passage.current_question).call
    gist = current_user.gists.new(question_id: @test_passage.current_question.id, github_gist_id: github_gist) if github_gist

    if gist && gist.save
      flash[:notice] = "#{ t('gists.successfully_created') } (#{view_context.link_to github_gist, Admin::GistsController.helpers.gist_url(github_gist)})"
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
