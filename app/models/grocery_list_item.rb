class GroceryListItem < ApplicationRecord
    belongs_to :Ingrident, :grocery_list
end
