class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update destroy update_inline]
  before_action :set_tests, only: %i[index update_inline]

  def index
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.issues.new(test_params)
    
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_tests
    @tests = Test.all
  end
end