# frozen_string_literal: true

module Service
  module BookEntry
    class Show
      def self.execute(id:, **_config)
        ::BookEntry.find_by!(id: id).decorate
      end
    end
  end
end
