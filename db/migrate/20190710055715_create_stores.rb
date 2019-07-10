class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :stores, :name, :unique => true
  end
end
