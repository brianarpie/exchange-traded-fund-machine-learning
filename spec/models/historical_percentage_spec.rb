require 'rails_helper'

RSpec.describe HistoricalPercentage, type: :model do
  it { should belong_to(:etf_holding) }
  it { should validate_presence_of(:percentage_date) }
  it { should validate_uniqueness_of(:percentage_date) }
end
