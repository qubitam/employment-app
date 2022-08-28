class Person < ApplicationRecord
    has_many :employments
    validates_presence_of :phone_number
    validates :first_name,  presence: true, length: { maximum: 25 }
    validates :last_name,  presence: true, length: { maximum: 50 }
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i } 

end
