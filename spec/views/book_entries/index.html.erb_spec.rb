# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'book_entries/index', type: :view do
  before(:each) do
    assign(:book_entries, [
             BookEntry.create!(attributes_for(:book_entry)),
             BookEntry.create!(attributes_for(:book_entry))
           ])
  end

  it 'renders a list of book_entries' do
    render
  end
end
