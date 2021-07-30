class RecipesController < ApplicationController
    
    helper_method :current_user, :logged_in?
    #before_action :authenticate_user!, except: [:index, :show]

    def index
        @recipe = Recipe.all
        
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
        @recipe.recipe_ingredients.build
        @recipe.ingredients.build
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user_id = current_user.id
        @recipe.ingredient = Recipe.ingredients.build(recipe_params[:ingredient])
    if !@recipe.title.blank? || !@recipe.category.blank?
        @recipe.save
    end
        if @recipe.save
            redirect_to @recipe, notice: "Successfully created new recipe"
        else
            render 'new'
        end
    end
end

private

    def recipe_params
        params.require(:recipe).permit(:title, :instructions, :category, recipe_ingredients_attributes: [:amount, :unit_of_measure] )
    end
