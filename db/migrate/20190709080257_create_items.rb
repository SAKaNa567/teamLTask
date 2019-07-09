class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.text :description

      t.timestamps
    end
    add_index :product, :title, :unique => true
  end
end
