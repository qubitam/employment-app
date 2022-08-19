FactoryBot.define do
  factory :person do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    nickname { Faker::Internet.user }
    email { Faker::Internet.safe_email }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
