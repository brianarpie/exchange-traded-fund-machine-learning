class HistoricalPercentageController < ApplicationController
  before_action :set_historical_percentage, only: [:update, :destroy]

  # GET /api/historical_percentage.json
  def index
    etf_symbol = params[:etf_symbol]
    holding_symbol = params[:holding_symbol]

    respond_to do |format|
      begin
        holding_id = Holding.where('name = ?', holding_symbol).first.id
        etf_id = Etf.where('name = ?', etf_symbol).first.id
        etf_holding = EtfHolding.where('holding_id = ? AND etf_id = ?', holding_id, etf_id).first
        historical_percentages = etf_holding.historical_percentages
        
        format.json { render json: historical_percentages }
      rescue
        # TODO: throw an error here?
        format.json { render plain: "Please specify a symbol for etf and holding.", status: :unprocessable_entity }
      end
    end
  end

  # POST /api/historical_percentage.json
  def create
  end

  # PATCH/PUT /api/historical_percentage/:id.json
  def update
  end

  # DELETE /api/historical_percentage/:id.json
  def destroy
  end

  private

  def set_historical_percentage
    @historical_percentage = HistoricalPercentage.find(params[:id])
  end
end
