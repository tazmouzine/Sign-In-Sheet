module Command
  module BookEntry
    class Show
      attr_accessor :id

      def initialize(id:)
        @id = id
      end

      def execute
        Service::BookEntry::Show.execute(id: @id)
      end
    end
  end
end
