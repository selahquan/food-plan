class CreateRecipeIngridents < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_ingridents do |t|
      t.string :amount
      t.string :unit_of_measure

      t.timestamps
    end
  end
end
