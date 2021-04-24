module Service
  module BookEntry
    class Show
      def self.execute(id:, **config)
        ::BookEntry.find_by!(id: id).decorate
      end
    end
  end
end
