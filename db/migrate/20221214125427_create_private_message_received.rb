# frozen_string_literal: true

class CreatePrivateMessageReceived < ActiveRecord::Migration[7.0]
  def change
    create_table :private_message_receiveds do |t|
      t.references :receiver, index: true, foreign_key: { to_table: :users }
      t.references :private_message
      t.timestamps
    end
  end
end
