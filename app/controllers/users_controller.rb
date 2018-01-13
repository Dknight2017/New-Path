class UsersController < ApplicationController
  before_action :authorize, except: [:index, :new, :create]

  def index
    @users = User.all
    @meals = Meal.all
  end

  def show
    @meals = Meal.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users"
    end
  end

  
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
