class ChangeColumnToItem < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :title, false
    change_column_null :items, :price, false
    chnage_column_null :items, :description, false
  end
end
