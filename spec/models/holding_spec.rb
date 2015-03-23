require 'rails_helper'

RSpec.describe Holding, type: :model do
  it { should have_many(:etfs).through(:etf_holdings) }
  it { should have_many(:historical_prices) }
  it { should validate_length_of(:name).is_at_least(1).is_at_most(5) }
  it { should validate_uniqueness_of(:name) }
end
