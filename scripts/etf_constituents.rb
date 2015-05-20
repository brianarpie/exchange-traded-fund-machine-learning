require_relative './query_builder'
require_relative './http_request_service'
require 'date'

qb = QueryBuilder.new
http = HttpRequestService.new

yesterday = (Date.today - 1).strftime("%A")
last_market_day = if yesterday == "Sunday" then (Date.today - 3)
                  elsif yesterday == "Saturday" then (Date.today - 2)
                  else (Date.today - 1) end

last_market_day_fmtd = last_market_day.strftime("%Y-%m-%d")

etfs = Array.new

etfs << { name: "FXI", desc: "china-largecap", product_id: 239536 } # China Large Cap
etfs << { name: "ITOT", desc: "core-sp-total-us-stock-market", product_id: 239724 } # US Broad Market
etfs << { name: "IVV", desc: "core-sp-500", product_id: 239726 } # US Large Cap
etfs << { name: "IWM", desc: "russell-2000", product_id: 239710 } # US Small Cap
etfs << { name: "IJR", desc: "core-sp-smallcap", product_id: 239774 }
etfs << { name: "IJH", desc: "core-sp-midcap", product_id: 239763 } # US Mid Cap
etfs << { name: "IYE", desc: "us-energy", product_id: 239507 } # US Energy
etfs << { name: "IYW", desc: "us-technology", product_id: 239522 } # US Technology

etfs.each { |etf|
  url = qb.build({
    scheme: "https",
    hostname: "ishares.com",
    path: "/us/products/#{etf[:product_id]}/ishares-#{etf[:desc]}-etf/1395165510754.ajax?",
    params: {
      fileType: "csv",
      fileName: "#{etf[:name]}_holdings",
      dataType: "fund"
    }
  })
  puts url
  puts http.get(url)
  File.open("lib/assets/etf_constituents/ishares/#{etf[:desc]}/#{etf[:name]}-#{last_market_day_fmtd}.csv", "w+") { |file| file.write(http.get(url)) }}

class EtfConstituents
  def date_validity_check
    # dynamically check the contents of the .csv
    # and find the correct date.
    # if no date found, check for last valid date..
    # could use a mailer to notify that previously valid date was found etc...
  end
end