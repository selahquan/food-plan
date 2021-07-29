class Recipe < ApplicationRecord
    
    has_many :recipe_ingridents
    has_many :ingredients, through: :recipe_ingridents
    belongs_to :user


    #validates :title, :category
end
