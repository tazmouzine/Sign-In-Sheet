# frozen_string_literal: true

module Service
  module BookEntry
    class Destroy
      def self.execute(id:, user:)
        ActiveRecord::Base.transaction do
          record = ::BookEntry.find_by(id: id, user: user)
          record.destroy!

          record
        end
      end
    end
  end
end
