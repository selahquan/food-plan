class Ingredient < ApplicationRecord
    
    validates_presence_of :name
    
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients
    has_many :grocery_list_items
    

    scope :popular_ingredients, -> {
        left_joins(:recipe_ingredient)
        .select("recipes.*, count(ingredients.id) AS total_ingredients")
        .group("recipes.id")
        .order("total_ingredients DESC")
    }

end
