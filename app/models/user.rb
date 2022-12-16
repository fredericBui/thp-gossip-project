# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :likes
  has_many :sub_comments
  has_many :private_message_receiveds, class_name: 'PrivateMessageReceived', foreign_key: 'receiver_id'
end
