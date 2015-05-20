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

 #["Date", "Open", "High", "Low", "Close", "Volume", "Adj Close"]
sune = CSV.read('lib/assets/historical-price-data/SUNE-2015-03-23.csv')
fslr = CSV.read('lib/assets/historical-price-data/FSLR-2015-03-23.csv')
scty = CSV.read('lib/assets/historical-price-data/SCTY-2015-03-23.csv')
 
scty.shift

sune.shift

fslr.shift

# reverse so index:1 is oldest data point
fslr.reverse.each do |line|
  HistoricalPrice.create([{
    priceable_id: 1, 
    priceable_type: "Holding", 
    date: Date.parse(line[0]), 
    open: line[1],
    high: line[2],
    low: line[3],
    close: line[4],
    volume: line[5]
  }])
end

sune.reverse.each do |line|
  HistoricalPrice.create([{
    priceable_id: 2, 
    priceable_type: "Holding", 
    date: Date.parse(line[0]), 
    open: line[1],
    high: line[2],
    low: line[3],
    close: line[4],
    volume: line[5]
  }])
end

scty.reverse.each do |line|
  HistoricalPrice.create([{
    priceable_id: 3, 
    priceable_type: "Holding", 
    date: Date.parse(line[0]), 
    open: line[1],
    high: line[2],
    low: line[3],
    close: line[4],
    volume: line[5]
  }])

  HistoricalPercentage.create([{
    date: Date.parse(line[0]),
    value: ((rand * 12 + 2) * 100).floor / 100.0,
    etf_holding_id: 3
  }])
end

