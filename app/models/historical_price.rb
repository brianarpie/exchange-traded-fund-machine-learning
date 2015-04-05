class HistoricalPrice < ActiveRecord::Base
  belongs_to :priceable, :polymorphic => true
  validates :price_date, :presence => true, :uniqueness => { scope: :priceable_id }
  validates :open, :presence => true
  validates :close, :presence => true
  validates :priceable_id, :presence => true
  validates :priceable_type, :presence => true
end
