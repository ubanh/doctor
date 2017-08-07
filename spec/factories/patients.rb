FactoryGirl.define do
  factory :patient do
    first_name { Faker::Zelda.character }
    last_name { Faker::Pokemon.name }
    phone_number {'809' + Faker::Number.number(digits=7)}
  end
end
