class Ingrident < ApplicationRecord
    
    has_many :grocery_list_items
    has_many :recipe_ingridents
    has_many :recipes, through: :recipe_ingridents
    
end
