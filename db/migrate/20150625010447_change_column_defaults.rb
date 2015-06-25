class ChangeColumnDefaults < ActiveRecord::Migration
  def change
    change_column_default :texts, :parent, -1
    change_column_default :texts, :latest, true
  end
end
