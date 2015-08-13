require 'rails_helper'

RSpec.describe HistoricalPercentage, type: :model do
  it { should belong_to(:etf_holding) }
  it { should validate_presence_of(:date) }
  it { 
    # this is a workaround to validate uniqueness with scope
    FactoryGirl.create(:etf_holding)
    should validate_uniqueness_of(:date) 
  }
end
