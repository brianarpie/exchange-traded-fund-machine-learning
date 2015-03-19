class RenameTickerSymbolColumnName < ActiveRecord::Migration
  def change
    rename_column :etfs, :ticker_symbol, :name
  end
end
