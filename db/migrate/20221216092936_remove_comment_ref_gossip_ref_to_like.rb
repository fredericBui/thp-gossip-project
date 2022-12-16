class RemoveCommentRefGossipRefToLike < ActiveRecord::Migration[7.0]
  def change
    remove_reference :likes, :comment, index: true, foreign_key: true
    remove_reference :likes, :gossip, index: true, foreign_key: true
  end
end
