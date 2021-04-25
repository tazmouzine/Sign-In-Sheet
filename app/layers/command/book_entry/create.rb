# frozen_string_literal: true

module Command
  module BookEntry
    class Create
      attr_accessor :user, :kind

      def initialize(user:, kind:)
        @user = user
        @kind = kind
      end

      def execute
        Service::BookEntry::Create.execute(user: @user, kind: @kind)
      end
    end
  end
end
