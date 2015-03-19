class AddIndiciesToPriceModel < ActiveRecord::Migration
  def change
    add_index :prices, :priceable_id
  end
end
