class AddPriceDateColumnToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :price_date, :string
  end
end
