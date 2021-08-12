class IngredientsController < ApplicationController
    
    def index
        @ingredients = Ingredient.all
    end

    def show
        @ingredient = Ingredient.find(params[:id])
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)

        if !@ingredient.name.blank?
            @ingredient.save
            redirect_to :ingredients
        else
            flash[:errors] = "Ingredient name must not be blank!"
            redirect_to new_ingredient_path
        end
    end

    def edit
		@ingredient = Ingredient.find(params[:id])
	end

	def update
		@ingredient = Ingredient.find(params[:id])

		if @ingredient.update(ingredient_params)
		redirect_to @ingredient
		else
		render :edit
		end
	end  

	def destroy
		@ingredient = Ingredient.find(params[:id])
		@ingredient.destroy

		redirect_to recipe_path
	end

    private
		def ingredient_params
		params.require(:ingredient).permit(:name)
		end
end
