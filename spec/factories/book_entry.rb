FactoryBot.define do
  factory :book_entry do     
    user { create(:user) }
    kind { [:arrive, :lunch_in, :lunch_out, :leave].sample }    
  end
end