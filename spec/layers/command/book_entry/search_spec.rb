# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Command::BookEntry::Search do
  describe '#execute' do
    let!(:book_entries) { create_list(:book_entry, 2) }
    subject { described_class.new.execute }

    it 'returns available book entries' do
      is_expected.to match_array(book_entries)
    end
  end
end
