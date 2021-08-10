class RecipeIngredient < ApplicationRecord
    
    belongs_to :recipe, foreign_key: "recipe_id"
    belongs_to :ingredient, foreign_key: "ingredient_id"

    accepts_nested_attributes_for :ingredient
    
end
