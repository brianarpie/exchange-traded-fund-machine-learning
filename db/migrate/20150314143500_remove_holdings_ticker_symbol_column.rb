class RemoveHoldingsTickerSymbolColumn < ActiveRecord::Migration
  def change
    remove_column :holdings, :ticker_symbol
  end
end
