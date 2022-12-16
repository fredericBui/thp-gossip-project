# frozen_string_literal: true

class SubComment < ApplicationRecord
  belongs_to :user
  belongs_to :attached, polymorphic: true
  has_many :sub_comments, as: :attached
end
