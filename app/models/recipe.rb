class Recipe < ApplicationRecord
    has_many :ingredients, through: :recipe_ingridents
    belongs_to :user
end
