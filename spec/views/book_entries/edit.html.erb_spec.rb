# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'book_entries/edit', type: :view do
  before(:each) do
    @book_entry = assign(:book_entry, BookEntry.create!(attributes_for(:book_entry)))
  end

  it 'renders the edit book_entry form' do
    render

    assert_select 'form[action=?][method=?]', book_entry_path(@book_entry), 'post' do
    end
  end
end
