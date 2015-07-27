class AddImageColumnsToProducts < ActiveRecord::Migration
  def change
    remove_column :products, :image
    add_column :products, :small_image, :string
    add_column :products, :medium_image, :string
    add_column :products, :large_image, :string
  end
end
