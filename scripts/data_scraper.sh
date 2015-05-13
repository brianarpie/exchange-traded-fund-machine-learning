#!/bin/sh
DATE="2015-05-12"
# TODAY=`date +%Y-%m-%d`
# declare -a holdings=("IVV" "IJH" "IJR" "IXJ" "IXC" "KXI" "IXG" "IGF" "MXI" "IXN" "IXP" "JXI" "IFGL" "FXI" "IEV" "ITF" "EWT" "EWW" "DGRO" "IEMG" "IXUS")
# for ticker in "${holdings[@]}"
# do
#   mkdir -p ../lib/assets/holdings-data/$ticker
#   curl --output ../lib/assets/holdings-data/$ti/$ticker/$ticker-2015-5-11 curl --output ../lib/assets/holdings-data/ ht/ https://www.ishares.com/us/products/239726/ishares-core-sp-500-etf/1395165510754.ajax?fileType=csv&fileName=$ticker_holdings&dataType=fund
# done

# FXI

mkdir -p ../lib/assets/holdings-data/FXI
curl --output ../lib/assets/holdings-data/FXI/FXI-$DATE.csv https://www.ishares.com/us/products/239536/ishares-china-largecap-etf/1395165510754.ajax?fileType=csv&fileName=FXI_holdings&dataType=fund

# IVV
mkdir -p ../lib/assets/holdings-data/IVV
curl --output ../lib/assets/holdings-data/IVV/IVV-$DATE.csv https://www.ishares.com/us/products/239726/ishares-core-sp-500-etf/1395165510754.ajax?fileType=csv&fileName=IVV_holdings&dataType=fund

# IWF
mkdir -p ../lib/assets/holdings-data/IWF
curl --output ../lib/assets/holdings-data/IWF/IWF-$DATE.csv https://www.ishares.com/us/products/239706/ishares-russell-1000-growth-etf/1395165510754.ajax?fileType=csv&fileName=IWF_holdings&dataType=fund

# IJH
mkdir -p ../lib/assets/holdings-data/IJH
curl --output ../lib/assets/holdings-data/IJH/IJH-$DATE.csv https://www.ishares.com/us/products/239763/ishares-core-sp-midcap-etf/1395165510754.ajax?fileType=csv&fileName=IJH_holdings&dataType=fund

# IJR
mkdir -p ../lib/assets/holdings-data/IJR
curl --output ../lib/assets/holdings-data/IJR/IJR-$DATE.csv https://www.ishares.com/us/products/239774/ishares-core-sp-smallcap-etf/1395165510754.ajax?fileType=csv&fileName=IJR_holdings&dataType=fund

# IXG
mkdir -p ../lib/assets/holdings-data/IXG
curl --output ../lib/assets/holdings-data/IXG/IXG-$DATE.csv https://www.ishares.com/us/products/239742/ishares-global-financials-etf/1395165510754.ajax?fileType=csv&fileName=IXG_holdings&dataType=fund

# DGRO
mkdir -p ../lib/assets/holdings-data/DGRO
curl --output ../lib/assets/holdings-data/DGRO/DGRO-$DATE.csv https://www.ishares.com/us/products/264623/ishares-core-dividend-growth-etf/1395165510754.ajax?fileType=csv&fileName=DGRO_holdings&dataType=fund

# IEV
mkdir -p ../lib/assets/holdings-data/IEV
curl --output ../lib/assets/holdings-data/IEV/IEV-$DATE.csv https://www.ishares.com/us/products/239736/ishares-europe-etf/1395165510754.ajax?fileType=csv&fileName=IEV_holdings&dataType=fund

# ITF
mkdir -p ../lib/assets/holdings-data/ITF
curl --output ../lib/assets/holdings-data/ITF/ITF-$DATE.csv https://www.ishares.com/us/products/239831/ishares-japan-largecap-etf/1395165510754.ajax?fileType=csv&fileName=ITF_holdings&dataType=fund

# EWW
mkdir -p ../lib/assets/holdings-data/EWW
curl --output ../lib/assets/holdings-data/EWW/EWW-$DATE.csv https://www.ishares.com/us/products/239670/ishares-msci-mexico-capped-etf/1395165510754.ajax?fileType=csv&fileName=EWW_holdings&dataType=fund

# IEMG
mkdir -p ../lib/assets/holdings-data/IEMG
curl --output ../lib/assets/holdings-data/IEMG/IEMG-$DATE.csv https://www.ishares.com/us/products/244050/ishares-core-msci-emerging-markets-etf/1395165510754.ajax?fileType=csv&fileName=IEMG_holdings&dataType=fund

# IYE
mkdir -p ../lib/assets/holdings-data/IYE
curl --output ../lib/assets/holdings-data/IYE/IYE-$DATE.csv https://www.ishares.com/us/products/239507/ishares-us-energy-etf/1395165510754.ajax?fileType=csv&fileName=IYE_holdings&dataType=fund

# IBB
mkdir -p ../lib/assets/holdings-data/IBB
curl --output ../lib/assets/holdings-data/IBB/IBB-$DATE.csv https://www.ishares.com/us/products/239699/ishares-nasdaq-biotechnology-etf/1395165510754.ajax?fileType=csv&fileName=IBB_holdings&dataType=fund

# IYW
mkdir -p ../lib/assets/holdings-data/IYW
curl --output ../lib/assets/holdings-data/IYW/IYW-$DATE.csv https://www.ishares.com/us/products/239522/ishares-us-technology-etf/1395165510754.ajax?fileType=csv&fileName=IYW_holdings&dataType=fund

# IYR
mkdir -p ../lib/assets/holdings-data/IYR
curl --output ../lib/assets/holdings-data/IYR/IYR-$DATE.csv https://www.ishares.com/us/products/239520/ishares-us-real-estate-etf/1395165510754.ajax?fileType=csv&fileName=IYR_holdings&dataType=fund