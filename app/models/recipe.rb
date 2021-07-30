class Recipe < ApplicationRecord
    
    has_many :recipe_ingridients
    has_many :ingredients, through: :recipe_ingridients
    belongs_to :user


    #validates :title, :category
end
