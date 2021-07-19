class User < ApplicationRecord
    has_many :messages
    has_many :replies
    has_secure_password
end