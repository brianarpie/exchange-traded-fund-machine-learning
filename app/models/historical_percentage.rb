class HistoricalPercentage < ActiveRecord::Base
  belongs_to :etf_holding
  validates :date, :presence => true, :uniqueness => true
end
