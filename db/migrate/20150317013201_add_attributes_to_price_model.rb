class AddAttributesToPriceModel < ActiveRecord::Migration
  def change
    change_table :prices do |t|
      t.column :open,   :decimal, precision:18, scale: 4
      t.column :close,  :decimal, precision:18, scale: 4
      t.column :low,    :decimal, precision:18, scale: 4
      t.column :high,   :decimal, precision:18, scale: 4
      t.column :volume, :integer
    end
  end
end
