class GroceryListsController < ApplicationController

    def index
        @grocery_list = GroceryList.all
    end

    def show
        @grocery_list = GroceryList.find(params[:id])
    end

    def new
        @grocery_list = GroceryList.new
        @grocery_list.grocery_list_items.build
        @grocery_list.ingredients.build
    end

    def create
        @grocery_list = GroceryList.new(grocery_list_params)
        @grocery_list.user_id = current_user.id
    if !@grocery_list.name.blank?
        @grocery_list.save
    end
        if @grocery_list.save
            redirect_to @grocery_list, notice: "Successfully created new grocery list"
        else
            render 'new'
        end
    end

    def edit
        @grocery_list = GroceryList.find(params[:id])
    end

    def update
        @grocery_list = GroceryList.find(params[:id])
    
        if @grocery_list.update(grocery_list_params)
            redirect_to @grocery_list
        else
            render action: "edit"
        end
    end

    def destroy
        @grocery_list = GroceryList.find(params[:id])
        @grocery_list.destroy
    
        redirect_to grocery_list_path
    end
end

private

def grocery_list_params
    params.require(:grocery_list).permit(:name, recipe_ingredients: [:amount, :unit_of_measure], ingredients: [:name])
end
