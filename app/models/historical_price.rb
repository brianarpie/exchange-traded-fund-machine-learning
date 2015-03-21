class HistoricalPrice < ActiveRecord::Base
  belongs_to :priceable, :polymorphic => true
  validates :value,      :presence => true
  validates :price_date, :presence => true
end
