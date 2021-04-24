require 'rails_helper'

RSpec.describe Command::BookEntry::Show do
  describe '#execute' do
    let!(:book_entry) { create(:book_entry) }
    subject { described_class.new(id: book_entry.id).execute }

    it 'loads a book_entry' do
      is_expected.to eq(book_entry)
    end
  end
end
