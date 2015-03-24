class HistoricalPrice < ActiveRecord::Base
  belongs_to :priceable, :polymorphic => true
  validates :price_date, :presence => true, :uniqueness => { scope: :priceable_id }
end
