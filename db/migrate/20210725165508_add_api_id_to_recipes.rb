class AddApiIdToRecipes < ActiveRecord::Migration[6.1]
    def change
        add_column :recipes, :api_id, :integer, foreign_key: true
    end
end