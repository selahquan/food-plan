class RecipeIngredientsController < ApplicationController
    
    def ingredient_attributes=(array)
        self.ingredient = Ingredient.find_or_create_by(array)
    end
    
end
