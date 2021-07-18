class Message < ApplicationRecord
    validates :message, presence: true
    validates :author, presence: true
end