class TestsController < ApplicationController
  before_action :find_test, only: [:show, :edit, :destroy]
  
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:id, :title, :level, :category_id)
  end
end