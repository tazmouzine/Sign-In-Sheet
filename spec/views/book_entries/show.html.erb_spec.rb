# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'book_entries/show', type: :view do
  before(:each) do
    @book_entry = assign(:book_entry, BookEntry.create!(attributes_for(:book_entry)))
  end

  it 'renders attributes in <p>' do
    render
  end
end
