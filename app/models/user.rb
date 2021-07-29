class User < ApplicationRecord
    has_secure_password
    validates :username, :email, uniqueness: true
    validates :username, :email, presence: true
    
    has_many :recipes
    has_many :grocery_list
    
end
