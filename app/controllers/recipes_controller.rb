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
        #@recipe.ingredient = Recipe.ingredients.build(recipe_params[:ingredient])
    if !@recipe.title.blank? || !@recipe.category.blank?
        @recipe.save
    end
        if @recipe.save
            redirect_to @recipe, notice: "Successfully created new recipe"
        else
            render 'new'
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
    
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render action: "edit"
        end
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
    
        redirect_to recipes_path
    end
end

private

    def recipe_params
        params.require(:recipe).permit(:title, :instructions, :category, recipe_ingredients: [:amount, :unit_of_measure], ingredients: [:name])
    end
