class RemoveHoldingEtfId < ActiveRecord::Migration
  def change
    change_table :holdings do |t|
      t.remove :etf_id
    end
  end
end
