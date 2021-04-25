# frozen_string_literal: true

class CreateBookEntry < ActiveRecord::Migration[6.1]
  def change
    create_table :book_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :kind

      t.timestamps
    end
  end
end
