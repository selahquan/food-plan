class RecipesController < ApplicationController

    def index
        @recipe = Recipe.all
    end

    def show
        
    end

    def new
        @recipe = current_user.recipes.build
    end

    def create_table
    end
end

private

    def recipe_params
        params.require(:title).permit(:title, :instructions)
    end
