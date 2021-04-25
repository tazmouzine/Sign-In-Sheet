# frozen_string_literal: true

class BookEntry < ApplicationRecord
  belongs_to :user

  enum kind: %i[arrive lunch_in lunch_out leave]

  validates :user, :kind, presence: true
end
