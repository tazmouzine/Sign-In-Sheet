# frozen_string_literal: true

FactoryBot.define do
  factory :book_entry do
    user { create(:user) }
    kind { %i[arrive lunch_in lunch_out leave].sample }
  end
end
