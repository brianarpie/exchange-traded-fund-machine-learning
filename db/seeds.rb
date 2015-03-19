# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

etfs = Etf.create([{ name: "TAN" }, { name: "KWT" }])

holdings = Holding.create([{ name: "FSLR", etf_id:0 }])

historical_price_data = Price.create([{
  value: 1.05,
  price_date: "2015-03-01",
  priceable: holdings.first
}])