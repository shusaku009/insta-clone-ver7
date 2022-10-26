FactoryBot.define do
  factory :user do
    
    email { Faker::Internet.unique.email }
    password { '12345678' }
    password_confirmation { '12345678' }
    username { Faker::Name.unique.name }
  end
end
