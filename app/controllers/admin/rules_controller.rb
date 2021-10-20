class Admin::RulesController < Admin::BaseController
  before_action :find_rule, only: %i[show edit update destroy]
  
  def index
    @rules = Rule.all
  end

  def new
    @rule = Rule.new
  end

  def create
    @rule = Rule.new(rule_params)
    
    if @rule.save
      redirect_to admin_rule_path(@rule)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @rule.update(rule_params)
      redirect_to admin_rule_path(@rule)
    else
      render :edit
    end
  end

  def destroy
    @rule.destroy
    redirect_to admin_rules_path
  end

  def show
  end

  private

  def find_rule
    @rule = Rule.find(params[:id])
  end

  def rule_params
    params.require(:rule).permit(:title, :category_id, :first_try, :level)
  end

end