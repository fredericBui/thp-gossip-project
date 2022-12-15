# frozen_string_literal: true

class CreateSubComments < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
