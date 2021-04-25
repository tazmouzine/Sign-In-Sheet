# frozen_string_literal: true

module Service
  module BookEntry
    class Destroy
      def self.execute(id:)
        ActiveRecord::Base.transaction do
          record = ::BookEntry.find(id)
          record.destroy!

          record
        end
      end
    end
  end
end
