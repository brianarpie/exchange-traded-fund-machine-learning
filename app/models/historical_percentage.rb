class HistoricalPercentage < ActiveRecord::Base
  belongs_to :etf_holding
  validates :percentage_date, :presence => true, :uniqueness => true
end
