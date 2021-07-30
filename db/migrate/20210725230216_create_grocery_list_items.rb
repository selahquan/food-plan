class CreateGroceryListItems < ActiveRecord::Migration[6.1]
  def change
    create_table :grocery_list_items do |t|
      t.string :name
      t.string :amount
      t.belongs_to :grocery_list, null: false, foreign_key: true
      t.belongs_to :recipe, null: false, foreign_key: true
      t.timestamps
    end
  end
end
