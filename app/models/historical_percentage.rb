class HistoricalPercentage < ActiveRecord::Base
  belongs_to :etf_holding
  validates :date, :presence => true
  validates_uniqueness_of :date, :scope => [:etf_holding]
end
