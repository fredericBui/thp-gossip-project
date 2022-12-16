class AddRefPolymorphicToLike < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :liked, polymorphic: true, index: true
  end
end
