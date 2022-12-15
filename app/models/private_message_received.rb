# frozen_string_literal: true

class PrivateMessageReceived < ApplicationRecord
  belongs_to :private_message
  belongs_to :receiver, class_name: 'User'
end
