# frozen_string_literal: true

class AddRefToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :city, foreign_key: true
  end
end
