# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service::BookEntry::Search do
  describe '.execute' do
    let!(:book_entry) { create_list(:book_entry, 2) }
    subject { described_class.execute }

    it 'returns available book_entry' do
      is_expected.to match_array(book_entry)
    end
  end
end
