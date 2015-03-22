require 'rails_helper'

RSpec.describe HistoricalPrice, type: :model do
  it { should validate_presence_of :value }
  it { should validate_presence_of :price_date }
  it { should belong_to :priceable }
end
