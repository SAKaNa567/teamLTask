class CreateProductStores < ActiveRecord::Migration[5.2]
  def change
    create_table :product_stores do |t|
      t.references :item, foreign_key: true
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
