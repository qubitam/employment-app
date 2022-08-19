FactoryBot.define do
  factory :employment do
    person { nil }
    employer { Faker::Company.name }
    date_started { Faker::Date.between(from: '2021-03-23', to: '2021-07-25') }
    date_ended { Faker::Date.between(from: '2022-03-23', to: '2022-07-25') }
  end
end
