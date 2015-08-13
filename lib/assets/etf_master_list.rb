class EtfMasterList
  def ishares
    etfs = Array.new
    
    etfs << { name: "FXI", desc: "china-largecap", product_id: 239536 } # China Large Cap
    etfs << { name: "ITOT", desc: "core-sp-total-us-stock-market", product_id: 239724 } # US Broad Market
    etfs << { name: "IVV", desc: "core-sp-500", product_id: 239726 } # US Large Cap
    etfs << { name: "IWM", desc: "russell-2000", product_id: 239710 } # US Small Cap
    etfs << { name: "IJR", desc: "core-sp-smallcap", product_id: 239774 }
    etfs << { name: "IJH", desc: "core-sp-midcap", product_id: 239763 } # US Mid Cap
    etfs << { name: "IYE", desc: "us-energy", product_id: 239507 } # US Energy
    etfs << { name: "IYW", desc: "us-technology", product_id: 239522 } # US Technology

    etfs
  end
end