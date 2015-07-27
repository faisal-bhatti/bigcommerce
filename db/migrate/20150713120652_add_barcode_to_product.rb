class AddBarcodeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :sku, :string
    add_column :products, :bar_code, :string
  end
end
