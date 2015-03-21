class Etf < ActiveRecord::Base
  has_many :etf_holdings
  has_many :holdings, :through => :etf_holdings
  has_many :historical_prices, :as => :priceable
  validates :name, presence: true, uniqueness: true
  validates_length_of :name, in: 1..5
end
