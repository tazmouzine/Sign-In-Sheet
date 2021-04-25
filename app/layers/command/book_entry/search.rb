# frozen_string_literal: true

module Command
  module BookEntry
    class Search
      attr_accessor :params

      def initialize(**params)
        @params = params
      end

      def execute
        Service::BookEntry::Search.execute(**@params)
      end
    end
  end
end
