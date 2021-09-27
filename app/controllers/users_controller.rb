class UsersController < ApplicationController
  before_action :user_params, only: :create

  #attr_reader :password
  #attr_writer :password_confirmation

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      redirect_to login_path, notice: 'Вы успешно зарегистрированы. Пожалуйста, пройдите авторизацию!'
    else  
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:login, :email, :password, :password_confirmation)
  end


end
