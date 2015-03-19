class CreateHoldings < ActiveRecord::Migration
  def change
    create_table :holdings do |t|
      t.string :name
      t.string :ticker_symbol

      t.timestamps
    end
  end
end
