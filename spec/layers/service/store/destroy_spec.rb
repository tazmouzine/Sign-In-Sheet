require 'rails_helper'

RSpec.describe Service::BookEntry::Destroy do
  describe '.execute' do
    let!(:book_entry) do
      create(:book_entry)
    end

    it 'destroys a store' do
      expect{ described_class.execute(id: book_entry.id) }
        .to change{ ::BookEntry.count }.by(-1)
    end
  end
end
