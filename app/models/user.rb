class User < ApplicationRecord
    has_many :spots, dependent: :destroy 
    has_secure_password 
end
