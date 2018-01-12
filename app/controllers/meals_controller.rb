class MealsController < ApplicationController
    def index
        @meals = Meal.all
        @meals.each do |m|
            puts m.title
        end
    end

    def show
        @meal = Meal.find(params[:id])
    end

    def edit
        @meal = Meal.find(params[:id])
    end

    def update
        @meal = Meal.find(params[:id])
        @meal.title = meal_params[:title]
        @meal.description = meal_params[:description]
        @meal.calories_amount = meal_params[:calories_amount]
        @meal.save
        redirect_to meal_path(@meal)
    end
  
    def new
        @meal = Meal.new
    end

    def create
        @meal = Meal.new
        @meal.title = meal_params[:title]
        @meal.description = meal_params[:description]
        @meal.calories_amount = meal_params[:calories_amount]
        @meal.user_id = session[:user_id]
        @meal.save
        redirect_to user_path(current_user)
    end

    def destroy
        @meal = Meal.find(params[:id])
        if @meal.destroy
            redirect_to users_path
        else
            redirect_to meal_path(@meal)
        end
    end


    private 
    def meal_params
      params.require(:meal).permit(:title, :description, :calories_amount)
    end
  
   
  
   
end
