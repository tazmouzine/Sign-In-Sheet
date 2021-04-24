require 'rails_helper'

RSpec.describe Command::BookEntry::Destroy do
  describe '#execute' do
    subject { described_class.new(id: store.id) }
    let!(:book_entry) do
      create(:book_entry)
    end

    it 'destroys a store' do
      expect{ subject.execute }.to change{ Store.count }.by(-1)
        .and change{ FinancialEntry.count }.by(-1)
    end
  end
end
