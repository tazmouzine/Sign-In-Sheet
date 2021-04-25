# frozen_string_literal: true

module Service
  module BookEntry
    class Show
      def self.execute(id:, user:)
        ::BookEntry.find_by!(id: id, user_id: user).decorate
      end
    end
  end
end
