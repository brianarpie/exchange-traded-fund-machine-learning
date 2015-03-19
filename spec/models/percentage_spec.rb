require 'rails_helper'

RSpec.describe Percentage, type: :model do
  it { should belong_to(:etf_holding) }
end
