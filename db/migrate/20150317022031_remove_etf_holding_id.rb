class RemoveEtfHoldingId < ActiveRecord::Migration
  def change
    change_table :etfs do |t|
      t.remove :holding_id
    end
  end
end
