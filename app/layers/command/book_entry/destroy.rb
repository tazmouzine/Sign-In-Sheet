# frozen_string_literal: true

module Command
  module BookEntry
    class Destroy
      attr_accessor :id, :user

      def initialize(id:, user:)
        @id = id
        @user = user
      end

      def execute
        Service::BookEntry::Destroy.execute(id: @id, user: @user)
      end
    end
  end
end
