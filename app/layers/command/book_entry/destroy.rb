# frozen_string_literal: true

module Command
  module BookEntry
    class Destroy
      attr_accessor :id

      def initialize(id:)
        @id = id
      end

      def execute
        Service::BookEntry::Destroy.execute(id: @id)
      end
    end
  end
end
