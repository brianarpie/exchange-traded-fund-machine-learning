class RenameHoldingsTickerSymbolColumn < ActiveRecord::Migration
  def change
    rename_column :holdings, :ticker_symbol, :name
  end
end
