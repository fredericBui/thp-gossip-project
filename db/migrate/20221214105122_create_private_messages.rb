# frozen_string_literal: true

class CreatePrivateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.references :sender, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
