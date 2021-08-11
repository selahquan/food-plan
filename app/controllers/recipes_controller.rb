class RecipesController < ApplicationController
    
    helper_method :current_user, :logged_in?
    #before_action :authenticate_user!, except: [:index, :show]

    def index
        @recipe = Recipe.alpha
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
        
        #if !@recipe.title.blank? || !@recipe.category.blank?
            @recipe.save
        #end
        if @recipe.save
            redirect_to recipe_path(@recipe), notice: "Successfully created new recipe"
        else
            redirect_to new_recipe_path
            #render 'new'
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
        params.require(:recipe).permit(
            :title, :instructions, :category, 
            recipe_ingredients_attributes: [:amount, :unit_of_measure, :id, :_destroy, ingredient_attributes: [:name, :id]]
        )
    end
