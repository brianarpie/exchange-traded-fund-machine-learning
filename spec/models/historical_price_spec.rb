require 'rails_helper'

RSpec.describe HistoricalPrice, type: :model do
  it { should belong_to :priceable }
  it { should validate_presence_of :date }
  it { should validate_presence_of :open }
  it { should validate_presence_of :close }
  it { should validate_presence_of :priceable_id }
  it { should validate_presence_of :priceable_type }
  it { should validate_uniqueness_of(:date).scoped_to(:priceable_id) }
end
