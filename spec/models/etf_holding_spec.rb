require 'rails_helper'

RSpec.describe EtfHolding, type: :model do
  it { should belong_to(:etf) }
  it { should belong_to(:holding) }
  it { should have_many(:historical_percentages) }
  it { should have_many(:historical_assets) }
  it { should validate_uniqueness_of(:holding_id).scoped_to(:etf_id)}
end
