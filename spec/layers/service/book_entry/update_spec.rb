# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service::BookEntry::Update do
  describe '.execute' do
    let!(:book_entry) { create(:book_entry) }
    let!(:change) { build_stubbed(:book_entry) }

    it 'updates a book_entry' do
      described_class.execute(id: book_entry.id, changes: change.attributes)
      expect(::BookEntry.last).to have_attributes(change.attributes)
    end
  end
end
