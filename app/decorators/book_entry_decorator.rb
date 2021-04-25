# frozen_string_literal: true

class BookEntryDecorator < ApplicationDecorator
  delegate_all

  def created_at
    model.created_at.to_formatted_s(:short)
  end
end
