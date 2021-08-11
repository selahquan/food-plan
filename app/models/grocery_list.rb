class GroceryList < ApplicationRecord
    belongs_to :user
    has_many :grocery_list_items
    has_many :ingredients, through: :grocery_list_items
    has_many :recipes

    def all_ingredients
        recipes.joins(:ingredients)
            .joins(:recipe_ingredients)
            .select("ingredients.name AS name, recipe_ingredients.amount AS amount, recipe_ingredients.unit_of_measure AS unit of measure")
            .order("name ASC")
            .distinct
    end

    def get_user_recipe_names
        current_user.recipes.map {|r| r.title }
    end

    def get_ingredient_info
        info = current_user.recipes.each do |recipe|
            recipe.recipe_ingredients.each do |ingredient|
                ingredient.amount, ingredient.ingredient.name, ingredient.unit_of_measure
            end
        end
        info.join(', ')
    end

    def get_ingredient_unit_of_measure(current_user)
        User.find(current_user).recipes.map {|r| r.recipe_ingredients.map{|i| i.unit_of_measure}}
    end

    def get_ingredient_amount
        current_user.recipes.map {|r| r.recipe_ingredients.map{|i| i.amount}}
    end

end
