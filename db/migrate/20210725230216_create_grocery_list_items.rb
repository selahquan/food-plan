class CreateGroceryListItems < ActiveRecord::Migration[6.1]
  def change
    create_table :grocery_list_items do |t|
      t.string :name
      t.string :amount

      t.timestamps
    end
  end
end
