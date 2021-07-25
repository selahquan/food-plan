class Api < ApplicationRecord

    #self.site = "https://api.spoonacular.com/recipes/complexSearch/?apiKey="
    #self.site_recipeinfo = "https://api.spoonacular.com/recipes/"

    #self.headers['Authorization'] = 'Token token="ded55717b4eb42968ba0caf2c32416c2"'

    #self.auth_type = :bearer
    #self.bearer_token = 'ded55717b4eb42968ba0caf2c32416c2'

    def self.complexSearch

        
        url = URI("https://api.spoonacular.com/recipes/complexSearch/?apiKey=ded55717b4eb42968ba0caf2c32416c2&query=")
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true 
        request = Net::HTTP::Get.new(url)

        response = https.request(request)
        
        #puts response.read_body
        JSON.parse(response.body)
        
    end
end