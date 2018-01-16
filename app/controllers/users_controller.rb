class UsersController < ApplicationController
  before_action :authorize, except: [:index, :new, :create]

  def index
    @users = User.all
    @meals = Meal.all
  end

  def show
    @user = User.find(params[:id])
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    end
  end

  
  
  def edit
    # see the meals controller for reference on what to place here and in the update action below...
    @User = User.find(params[:id])
  end
  
  def update
    @User = User.find(params[:id])
    @User.email = user_params[:email]
    @User.password = user_params[:password]
    @User.save
    redirect_to user_path(current_user)
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      session[:user_id] = nil
      redirect_to root_path
    end
  end
  
  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
