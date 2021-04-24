require 'rails_helper'

RSpec.describe Service::BookEntry::Show do
  describe '#execute' do
    let!(:book_entry) { create(:book_entry) }

    it 'loads a book_entry' do
      expect(described_class.execute(id: book_entry.id)).to eq(book_entry)
    end
  end
end
