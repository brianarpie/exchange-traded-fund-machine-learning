class EtfHolding < ActiveRecord::Base
  belongs_to :etf
  belongs_to :holding
  has_many :percentages
end
