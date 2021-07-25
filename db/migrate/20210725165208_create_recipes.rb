class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :recipe_ingrident
      t.string :category
      t.string :instructions
      t.string :image

      t.timestamps
    end
  end
end
