require 'rails_helper'

RSpec.describe Etf, type: :model do

  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).is_at_least(1).is_at_most(5) }
  it { should have_many(:holdings).through(:etf_holdings) }
  it { should have_many(:historical_prices) }

end
