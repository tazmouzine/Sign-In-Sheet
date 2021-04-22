# frozen_string_literal: true

class CreateBook < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :kind

      t.timestamps
    end
  end
end
