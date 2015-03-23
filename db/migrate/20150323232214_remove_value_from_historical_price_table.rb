class RemoveValueFromHistoricalPriceTable < ActiveRecord::Migration
  def change
    change_table :historical_prices do |t|
      t.remove :value
    end
  end
end
