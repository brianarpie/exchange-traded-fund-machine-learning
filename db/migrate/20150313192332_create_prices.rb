class CreatePrices < ActiveRecord::Migration
  def change
    create_table :historical_prices do |t|
      t.float :value
      t.integer :priceable_id
      t.string :priceable_type

      t.timestamps
    end
  end
end
