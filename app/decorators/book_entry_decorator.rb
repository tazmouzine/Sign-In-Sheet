class BookEntryDecorator < ApplicationDecorator
  delegate_all

  def create_at
    model.create_at.to_formatted_s(:long_ordinal)
  end
end
