class RecipesController < ApplicationController
    
    helper_method :current_user, :logged_in?
    before_action :require_login
    before_action :set_recipe, except: [:index, :new, :create]
    skip_before_action :require_login, only: [:index, :show]

    def index
        if params[:search]
            @params = params.permit(:search).to_h
            @recipe = Recipe.search(params[:search])
        else  
            @recipe = Recipe.alpha
            @params = params.permit(:category, :title)
            #@ingredients = @recipe.ingredients
        end
    end

    def show
    end
    
    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.user_id = current_user.id
        
        if @recipe.save
            redirect_to recipe_path, flash[:notice] = ["Successfully created new recipe"]
        else
            flash[:errors] = "Recipe fields must not be blank!"
            redirect_to new_recipe_path
        end
    end

    def edit
    end

    def update
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render action: "edit"
        end
    end

    def destroy
        @recipe.destroy
        redirect_to recipes_path
    end

end

private

    def recipe_params
        params.require(:recipe).permit(
            :title, :instructions, :category, :commit,
            recipe_ingredients_attributes: [:amount, :unit_of_measure, :id, :_destroy, ingredient_attributes: [:name, :id]]
        )
    end

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
