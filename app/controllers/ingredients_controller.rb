class IngredientsController < ApplicationController
    before_action :set_ingredient, except: [:index, :new, :create]

    def index
        if params[:recipe_id] && @recipe = Recipe.find_by(id: params[:recipe_id])
            @ingredients = @recipe.ingredients
        else 
            @ingredients = Ingredient.all
        end
    end

    def show
    end

    def new
        @ingredient = Ingredient.new
        if params[:recipe_id]
            @recipe = Recipe.find_by(id: params[:recipe_id])
            @ingredients = @recipe.ingredients.build
        else 
            @ingredient = Ingredient.new
            @ingredient.build_recipe
        end
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)

        if @ingredient.save
            redirect_to :ingredients, flash[:notice] = ["Successfully created new recipe"]
        else
            flash[:errors] = "Ingredient name must not be blank!"
            redirect_to new_ingredient_path
        end
    end

    def edit
	end

	def update
		if @ingredient.update(ingredient_params)
		    redirect_to @ingredient
		else
		    render :edit
		end
	end  

	def destroy
		@ingredient.destroy
		redirect_to recipe_path
	end

    private
		def ingredient_params
		params.require(:ingredient).permit(:name, :recipe_id)
		end

        def set_ingredient
            @ingredient = Ingredient.find(params[:id])
        end
end
