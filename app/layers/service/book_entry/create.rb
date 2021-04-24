module Service
  module BookEntry
    class Create
      def self.execute(user:, kind:)
        ActiveRecord::Base.transaction do          
          ::BookEntry.create!(user: user, kind: kind)                  
        rescue StandardError => e
          raise "Save failed: #{e.message}"
        end
      end
    end
  end
end
