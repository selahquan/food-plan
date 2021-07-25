class RecipeSearch

    attr_reader :response, :businesses

    def initialize()
        url = URI("https://api.spoonacular.com/recipes/complexSearch")
        params = {
            query: "",
            number: 50
        }

    response = HTTP.auth("Bearer #{ENV["SPOONACULAR_API_KEY"]}").get(url, params: params)
    @response = response.parse
    @recipes = @response["recipes"]
    end

    def to_recipes
        recipes_ids = self.recipes.map do |recipe|
            Recipe.find_or_create_by(api_id: recipe["id"]) do |recipe|
                restaurant.name = business["name"]
                restaurant.url = business["url"]
                restaurant.image_url = business["image_url"]
                restaurant.address = business["location"]["display_address"].join(", ")
                restaurant.zip_code = business["location"]["zip_code"].to_i
                restaurant.kind_of_food = business["categories"].map{|hash| hash["title"]}.join(", ")
        end.id
    end
    Restaurant.where(id: restaurant_ids)
    end
end