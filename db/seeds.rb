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

holdings.each do |x|
  EtfHolding.create([{
    etf_id: 0, 
    holding_id: x.id
  }])
end

scty = CSV.read('lib/assets/historical-price-data/SCTY-2015-03-23.csv')
 #["Date", "Open", "High", "Low", "Close", "Volume", "Adj Close"]
scty.shift

# reverse so index:1 is oldest data point
scty.reverse.each do |line|
  HistoricalPrice.create([{
    priceable_id: 3, 
    priceable_type: "Holding", 
    price_date: Date.parse line[0], 
    open: line[1],
    high: line[2],
    low: line[3],
    close: line[4],
    volume: line[5]
  }])

  HistoricalPercentage.create([{
    percentage_date: line[0],
    value: ((rand * 12 + 2) * 100).floor / 100.0,
    etf_holding_id: 3
  }])
end

