require 'rails_helper'

RSpec.describe Price, type: :model do
  it { should validate_presence_of :value }
  it { should validate_presence_of :price_date }
end
