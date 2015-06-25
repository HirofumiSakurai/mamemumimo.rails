class SelfReferenceToParent < ActiveRecord::Migration
  def change
    remove_column :texts, :parent
    add_reference :texts, :parent_id, index: true
  end
end
