# frozen_string_literal: true

class GossipTag < ApplicationRecord
  belongs_to :gossip
  belongs_to :tag
end
