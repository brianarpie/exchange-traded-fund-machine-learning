# TODO: move these factories out of ./test and into ./spec

FactoryGirl.define do
  factory :historical_price do
    
    priceable_id 1
    priceable_type 'Holding'
    price_date Date.parse "2015-01-01"

    open 100
    close 101
    low 99
    high 102
    volume 1000000
  
  end
end