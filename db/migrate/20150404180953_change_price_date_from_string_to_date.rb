class ChangePriceDateFromStringToDate < ActiveRecord::Migration
  def up
    change_column :historical_prices, :price_date, :date
  end

  def down
    change_column :historical_prices, :price_date, :string
  end
end
