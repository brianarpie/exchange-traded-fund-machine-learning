class EtfHolding < ActiveRecord::Base
  belongs_to :etf
  belongs_to :holding
  has_many :historical_percentages
  has_many :historical_assets

  validates :holding_id, :uniqueness => {scope: :etf_id}
end
