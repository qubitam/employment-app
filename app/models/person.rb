class Person < ApplicationRecord
    has_many :employments
    validates_presence_of :first_name, :last_name, :email, :phone_number
end
