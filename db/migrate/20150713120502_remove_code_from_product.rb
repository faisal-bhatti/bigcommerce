class RemoveCodeFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :code
  end
end
