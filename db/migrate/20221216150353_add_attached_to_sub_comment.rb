class AddAttachedToSubComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :sub_comments, :attached, polymorphic: true, index: true
  end
end
