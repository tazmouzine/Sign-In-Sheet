# frozen_string_literal: true

module Command
  module BookEntry
    class Show
      attr_accessor :id, :user

      def initialize(id:, user:)
        @id = id
        @user = user
      end

      def execute
        Service::BookEntry::Show.execute(id: @id, user: @user)
      end
    end
  end
end
