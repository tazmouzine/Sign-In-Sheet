# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'book_entries/new', type: :view do
  before(:each) do
    assign(:book_entry, BookEntry.new)
  end

  it 'renders new book_entry form' do
    render

    assert_select 'form[action=?][method=?]', book_entries_path, 'post' do
    end
  end
end
