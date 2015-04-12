class RemoveTickerSymbolColumn < ActiveRecord::Migration
  def change
    remove_column :etfs, :ticker_symbol
  end
end
