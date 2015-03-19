class Holding < ActiveRecord::Base
  has_many :etf_holdings
  has_many :etfs, :through => :etf_holdings 
  has_many :prices, :as => :priceable
  validates_length_of :name, in: 1..5
end
