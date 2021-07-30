class GroceryListItem < ApplicationRecord
    
    belongs_to :grocery_list
    belongs_to :ingridient

end
