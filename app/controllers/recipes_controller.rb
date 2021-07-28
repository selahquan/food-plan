class RecipesController < ApplicationController
    
    #before_action :authenticate_user!, except: [:index, :show]

    def index
        @recipe = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user_id = current_user.id
    if !@recipe.title.blank? || !@recipe.category.blank?
        @post.save
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
        params.require(:recipe).permit(:title, :instructions, :ingredient, :recipe_ingrident, :category)
    end
