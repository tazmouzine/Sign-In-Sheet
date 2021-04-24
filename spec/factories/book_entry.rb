FactoryBot.define do
  factory :book_entry do     
    user { create(:user) }
    kind { Faker::Number.between(from: 1, to: 4) }    
  end
end