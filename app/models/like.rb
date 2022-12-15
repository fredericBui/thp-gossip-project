# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
  belongs_to :comment
end
