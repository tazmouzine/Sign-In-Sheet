module Service
  module BookEntry
    class Update
      def self.execute(id:, changes:)
        book_entry = ::BookEntry.find_by!(id: id)
        book_entry.update(changes)

        book_entry.decorate
      end
    end
  end
end
