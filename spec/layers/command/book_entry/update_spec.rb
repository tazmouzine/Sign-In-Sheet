# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Command::BookEntry::Update do
  describe '#execute' do
    let!(:book_entry) { create(:book_entry) }
    let!(:change) { build_stubbed(:book_entry) }

    subject { described_class.new(id: book_entry.id, changes: change.attributes) }

    it 'updates a bookentry' do
      subject.execute
      expect(BookEntry.last).to have_attributes(change.attributes)
    end
  end
end
