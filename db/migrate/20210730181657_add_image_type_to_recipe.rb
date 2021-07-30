class AddImageTypeToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :imageType, :string
  end
end
