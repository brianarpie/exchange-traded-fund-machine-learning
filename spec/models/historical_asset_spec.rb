require 'rails_helper'

RSpec.describe HistoricalAsset, type: :model do
  it { should belong_to(:etf_holding) }
end
