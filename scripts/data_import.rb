require 'net/http'
require 'date'
require 'csv'
require 'uri'
require 'pry'

class DataImport < ActiveRecord::Base
  attr_accessor :date, :etfs

  def initialize
    @date = get_most_recent_market_date()
    @etfs = get_etfs()
  end

  def run
    @etfs.each do |etf|
      # puts "response #{response}"
      url = get_url(etf)
      response = http_get(url)
      store_in_database(response)
      # if valid_date?(response)
        # puts "doing stuff"
      # end
    end
  end

  def get_etfs
    list = EtfMasterList.new
    list.ishares
  end

  def store_in_database data
    # CSV manipulation goes here
    CSV.parse(data) do |row|
    binding.pry
      
    end
  end

  def get_url etf
    "https://www.ishares.com/us/products/#{etf[:product_id]}/ishares-#{etf[:desc]}-etf/1395165510754.ajax?fileType=csv&fileName=#{etf[:name]}_holdings&dataType=fund"
  end

  def get_most_recent_market_date
    yesterday = (Date.today - 1).strftime("%A")
    # market is closed on the weekends
    most_recent_market_date = if yesterday == "Sunday" then (Date.today - 3)
                              elsif yesterday == "Saturday" then (Date.today - 2)
                              else (Date.today - 1) end

    # .strftime("%Y-%m-%d")
    most_recent_market_date
  end

  def valid_date? content
    content.each_line do |line|
      if line.index("Fund Holdings as of")
        day_idx = line.index(@date.day.to_s)
        year_idx = line.index(@date.year.to_s)
        binding.pry
        if day_idx && year_idx && (day_idx != year_idx)
          return true
        else
          return false
        end
      end
    end
    return false
  end

  def http_get url
    uri = URI(url)
    Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new uri
      (http.request request).body
    end
  end
end

# try require relative...
class EtfMasterList
  def ishares
    etfs = Array.new
    
    etfs << { name: "FXI",  desc: "china-largecap",                product_id: 239536 } # China Large Cap
    etfs << { name: "ITOT", desc: "core-sp-total-us-stock-market", product_id: 239724 } # US Broad Market
    etfs << { name: "IVV",  desc: "core-sp-500",                   product_id: 239726 } # US Large Cap
    etfs << { name: "IWM",  desc: "russell-2000",                  product_id: 239710 } # US Small Cap
    etfs << { name: "IJR",  desc: "core-sp-smallcap",              product_id: 239774 } # US S&P Small Cap
    etfs << { name: "IJH",  desc: "core-sp-midcap",                product_id: 239763 } # US Mid Cap
    etfs << { name: "IYE",  desc: "us-energy",                     product_id: 239507 } # US Energy
    etfs << { name: "IYW",  desc: "us-technology",                 product_id: 239522 } # US Technology

    etfs
  end
end

data_import = DataImport.new
data_import.run()
