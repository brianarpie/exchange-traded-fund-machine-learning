FactoryGirl.define do
  factory :historical_price do
    
    priceable_id 1
    priceable_type 'Holding'
    price_date '2015-01-01'

    open 100
    close 101
    low 99
    high 102
    volume 1000000
  
  end
end