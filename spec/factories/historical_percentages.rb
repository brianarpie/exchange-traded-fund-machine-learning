FactoryGirl.define do
  factory :historical_percentage do

    id 1
    value 5.0283
    percentage_date Date.parse("2014-11-15")
    etf_holding_id 1
    
  end
end