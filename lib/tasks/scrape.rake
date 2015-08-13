namespace :scrape do
  desc "scrapes yesterday's etf data"
  task etfs: :environment do
    require 'net/http'
    require 'date'
    require 'csv'
    require 'uri'
    require 'pry'

    def etf_query
      [
        { ticker: "FXI",  name: "china-largecap",                id: 239536 },
        { ticker: "ITOT", name: "core-sp-total-us-stock-market", id: 239724 },
        { ticker: "IVV",  name: "core-sp-500",                   id: 239726 },
        { ticker: "IWM",  name: "russell-2000",                  id: 239710 },
        { ticker: "IJR",  name: "core-sp-smallcap",              id: 239774 },
        { ticker: "IJH",  name: "core-sp-midcap",                id: 239763 },
        { ticker: "IYE",  name: "us-energy",                     id: 239507 },
        { ticker: "IYW",  name: "us-technology",                 id: 239522 }
      ]
    end

    def start
      urls = url_generator(etf_query)
      urls.each do |url|
        response = get(url[:address])
        process(response, url[:ticker])
      end
    end

    def process(response, ticker)
      @etf = Etf.where(name: ticker).first
      if @etf.nil?
        @etf = Etf.create({ name: ticker })
      end
      CSV.parse(response) do |row|
        if row.include? "Fund Holdings as of"
          @date = Date.parse(row.last)
        end
        if row.include? "Total Net Assets"
          total_net_assets = row.last.slice 1, row.last.length
        end
        if row.first.index(/([A-Z]|[0-9]){2,5}/) == 0
          save_row_to_database(row)
        end
      end
    end

    def save_row_to_database(row)
      @holding = Holding.where(name: row.first).first
      if @holding.nil?
        @holding = Holding.create({name: row.first})
      end
      @etf_holding = EtfHolding.where(etf_id: @etf.id).where(holding_id: @holding.id).first
      if @etf_holding.nil?
        @etf_holding = EtfHolding.create({ etf_id: @etf.id, holding_id: @holding.id })
      end
      HistoricalPercentage.create({ value: row[4], date: @date, etf_holding_id: @etf_holding.id })
    end

    def url_generator(query)
      urls = []
      query.each do |etf|
        urls << { 
          address: "https://www.ishares.com/us/products/#{etf[:id]}/ishares-#{etf[:name]}-etf/1395165510754.ajax?" + URI.encode_www_form({
              fileType: "csv",
              fileName: "#{etf[:ticker]}_holdings",
              dataType: "fund"
            }),
          ticker: etf[:ticker]
        }
      end

      urls
    end

    def get(url)
      uri = URI(url)
      Net::HTTP.start(uri.host, uri.port,
        :use_ssl => uri.scheme == 'https') do |http|
        request = Net::HTTP::Get.new uri
        (http.request request).body
      end
    end

    start
  end
end
