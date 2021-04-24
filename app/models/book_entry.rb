# frozen_string_literal: true

class BookEntry < ApplicationRecord
  include LiberalEnum

  attribute :user_id,          :integer  
  attribute :kind,             :integer  

  validates :user, :kind, presence: true

  belongs_to :user
  
  enum kind: {
    arrive: 1,
    lunch_in: 2,
    lunch_out: 3,
    leave: 4
  }

  liberal_enum :kind
end