# frozen_string_literal: true

class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: 'User'
end
