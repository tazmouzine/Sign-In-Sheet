# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service::BookEntry::Destroy do
  describe '.execute' do
    let!(:book_entry) do
      create(:book_entry)
    end

    it 'destroys a book_entry' do
      expect { described_class.execute(id: book_entry.id, user: book_entry.user.id) }
        .to change { ::BookEntry.count }.by(-1)
    end
  end
end
