require 'rails_helper'

RSpec.describe HistoricalPercentage, type: :model do
  it { should belong_to(:etf_holding) }
end
