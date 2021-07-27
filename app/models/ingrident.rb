class Ingrident < ApplicationRecord
    has_many :recipe_ingridents, :grocery_list_items
    
end
