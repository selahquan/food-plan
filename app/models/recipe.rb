class Recipe < ApplicationRecord
    
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :grocery_lists

    validates_presence_of :title
    validates_presence_of :category
    validates_uniqueness_of :title

    accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

    before_save :find_or_create_ingredients

    scope :category, -> (category){where("category LIKE ?", "%#{category}%")}

    scope :search,-> (title){where("title LIKE ?", "%#{title}%")}

    scope :alpha, -> {order('title')}

    def find_or_create_ingredients
        self.recipe_ingredients.each do |recipe_ingredient|
        recipe_ingredient.ingredient = Ingredient.find_or_create_by(name: recipe_ingredient.ingredient.name)
        end
    end

    def created_by
        User.where(user_id: self.id)
    end

    


end
