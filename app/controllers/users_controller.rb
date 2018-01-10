class UsersController < ApplicationController
  def index
  end

  def show
    before_action :authorize, only: [:show]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to_new_session_path
    end
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, password_confirmation)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end