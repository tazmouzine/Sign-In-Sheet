require 'rails_helper'

RSpec.describe Command::BookEntry::Search do
  describe '#execute' do
    let!(:book_entry) { create_list(:book_entry, 2) }
    subject { described_class.new.execute }

    it 'returns available book_entry' do
      is_expected.to match_array(stores)
    end
  end
end
