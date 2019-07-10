class CreateProductStores < ActiveRecord::Migration[5.2]
  def change
    create_table :product_stores do |t|

      t.timestamps
    end
  end
end
