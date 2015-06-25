class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :entity
      t.integer :parent
      t.boolean :latest

      t.timestamps null: false
    end
  end
end
