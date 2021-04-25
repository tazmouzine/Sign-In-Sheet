# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Command::BookEntry::Create do
  describe '#execute' do
    subject { described_class.new(attributes_for(:book_entry)) }

    it 'create a book entry' do
      expect { subject.execute }.to change { BookEntry.count }.by(1)
    end
  end
end
