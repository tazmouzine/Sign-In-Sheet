module Command
  module BookEntry
    class Update
      attr_accessor :user
      attr_accessor :changes

      def initialize(id:, changes:)
        @id = id
        @changes = changes
      end

      def execute
        Service::BookEntry::Update.execute(id: @id, changes: changes)
      end
    end
  end
end
