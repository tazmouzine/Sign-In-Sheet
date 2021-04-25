# frozen_string_literal: true

module Service
  module BookEntry
    class Create
      def self.execute(user:, kind:)
        ::BookEntry.create(user: user, kind: kind)
      end
    end
  end
end
