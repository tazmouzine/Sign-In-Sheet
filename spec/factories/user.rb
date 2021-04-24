FactoryBot.define do
  factory :user do    
    email { Faker::Internet.email }
    password { 'teste123' }
  end
end