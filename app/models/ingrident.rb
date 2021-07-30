class Ingridient < ApplicationRecord
    
    has_many :grocery_list_items
    has_many :recipe_ingridients
    has_many :recipes, through: :recipe_ingridients
    
end
