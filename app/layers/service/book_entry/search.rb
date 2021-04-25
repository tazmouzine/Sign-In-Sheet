# frozen_string_literal: true

module Service
  module BookEntry
    class Search
      def self.execute(**params)
        order = params.fetch(:order, 'created_at desc')
        ::BookEntry.where(params).order(order).decorate
      end
    end
  end
end
