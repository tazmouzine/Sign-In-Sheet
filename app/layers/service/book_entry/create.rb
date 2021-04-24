module Service
  module BookEntry
    class Create
      def self.execute(user:, kind:)
        ActiveRecord::Base.transaction do
          puts kind
          ::BookEntry.create!(user: user, kind: kind.to_s)                  
        rescue StandardError => e
          raise "Save failed: #{e.message}"
        end
      end
    end
  end
end
