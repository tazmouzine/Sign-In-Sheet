# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service::BookEntry::Create do
  describe '#execute' do
    it 'create a book entry' do
      expect { described_class.execute(attributes_for(:book_entry)) }
        .to change { BookEntry.count }.by(1)
    end
  end
end
