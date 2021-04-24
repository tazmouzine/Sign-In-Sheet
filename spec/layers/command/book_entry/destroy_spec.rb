require 'rails_helper'

RSpec.describe Command::BookEntry::Destroy do
  describe '#execute' do
    subject { described_class.new(id: book_entry.id) }
    let!(:book_entry) do
      create(:book_entry)
    end

    it 'destroys a book_entry' do
      expect{ subject.execute }.to change{ BookEntry.count }.by(-1)
    end
  end
end
