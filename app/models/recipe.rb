class Recipe < ApplicationRecord
    
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    belongs_to :user


    validates_presence_of :title
    validates_presence_of :category
    validates_uniqueness_of :title


    accepts_nested_attributes_for :recipe_ingredients
    accepts_nested_attributes_for :ingredients
end
