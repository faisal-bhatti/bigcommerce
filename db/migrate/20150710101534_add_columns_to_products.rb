class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :productId, :string
    add_column :products, :name, :string
    add_column :products, :code, :string
    add_column :products, :isAvailable, :string
    add_column :products, :image, :string
  end
end
