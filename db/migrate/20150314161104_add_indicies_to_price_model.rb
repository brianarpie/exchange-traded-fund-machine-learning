class AddIndiciesToPriceModel < ActiveRecord::Migration
  def change
    add_index :historical_prices, :priceable_id
  end
end
