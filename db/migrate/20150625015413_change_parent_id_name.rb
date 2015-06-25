class ChangeParentIdName < ActiveRecord::Migration
  def change
    remove_reference :texts, :parent_id
    add_reference :texts, :parent, index: true
  end
end
