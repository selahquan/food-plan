class CreateRecipeIngridents < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_ingridients do |t|
      t.string :amount
      t.string :unit_of_measure
      t.belongs_to :ingredient
      t.belongs_to :recipe
      t.timestamps
    end
  end
end
