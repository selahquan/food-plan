class Recipe < ApplicationRecord
    
    belongs_to :user
    has_many :recipe_ingredients, inverse_of: :recipe
    has_many :ingredients, through: :recipe_ingredients
    


    validates_presence_of :title
    validates_presence_of :category
    validates_uniqueness_of :title


    accepts_nested_attributes_for :recipe_ingredients
    accepts_nested_attributes_for :ingredients

    # def recipe_ingredients_attributes=(a)
    #     self.recipe_ingredients = RecipeIngredient.create(a)
    #     self.recipe_ingredients.update(a)
    #     # a.values.each do |i|

    #     #     recipe_ingredients.build(i)
    #     # end
    # end

    def ingredients_attributes=(hash)
        self.ingredient = Ingredient.find_or_create_by(hash)
    end
end
