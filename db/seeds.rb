require 'csv'

etfs = Etf.create([
  { name: "TAN" }, 
  { name: "KWT" }
])

holdings = Holding.create([
  { name: "FSLR" },
  { name: "SUNE" },
  { name: "SCTY" },
])

sune = CSV.read('../lib/assets/historical_price_data/SCTY-2015-03-23.csv')
sune.shift

sune.each do |line|
  HistoricalPrice.create([{
    value: line
  }])
end

historical_price_data = Price.create([{
  value: 1.05,
  price_date: "2015-03-01",
  priceable: holdings.first
}])