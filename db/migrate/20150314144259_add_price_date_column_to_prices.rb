class AddPriceDateColumnToPrices < ActiveRecord::Migration
  def change
    add_column :historical_prices, :price_date, :string
  end
end
